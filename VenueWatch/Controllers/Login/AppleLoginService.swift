//
//  LoginService.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import Foundation
import AuthenticationServices

protocol AppleLoginServiceDelegate {
    func login(completion: @escaping (Result<AppleLoginService.AuthResult, Error>) -> Void)
}

final class AppleLoginService: NSObject, AppleLoginServiceDelegate {
    struct AuthResult {
        let fullName: [String]
        let token: String
    }
    
    private var handler: ((Result<AuthResult, any Error>) -> Void)?
    
    func login(completion: @escaping (Result<AuthResult, any Error>) -> Void) {
        self.handler = completion
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

// MARK: - ASAuthorizationControllerDelegate
extension AppleLoginService: ASAuthorizationControllerDelegate {
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: any Error
    ) { self.handler?(.failure(error)) }
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let identityToken = credential.identityToken
        else { fatalError() }
        let fullname = [
            credential.fullName?.givenName,
            credential.fullName?.familyName
        ].compactMap { $0 }
        let token = String(decoding: identityToken, as: UTF8.self)
        let authResult = AuthResult(fullName: fullname, token: token)
        self.handler?(.success(authResult))
    }
}

// MARK: - ASAuthorizationControllerPresentationContextProviding
extension AppleLoginService: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(
        for controller: ASAuthorizationController
    ) -> ASPresentationAnchor { UIApplication.shared.getCurrentWindow() }
}
