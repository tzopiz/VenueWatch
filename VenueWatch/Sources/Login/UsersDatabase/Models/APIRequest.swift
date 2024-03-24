//
//  APIRequest.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

enum APIRequest {
    enum HTTPMethod: String {
        case GET
        case POST
    }
    enum HTTPHeaders: String {
        case contentType = "Content-Type"
        case applicationJson = "application/json"
    }
    enum ServiceError: Error {
        case server(String)
        case unknown(String = "An unknown error occured.")
        case decoding(String = "Error parsing server response.")
    }
    struct WebSite {
        static let scheme = "http"
        static let baseURL = "localhost"
        static let port: Int? = 5000
        static let fullURL = "http://localhost:5000/"
    }
    case createAccount(path: String = "/auth/create-account", userRequest: UserRequest.SignUp)
    case signIn(path: String = "/auth/sign-in", userRequest: UserRequest.SignIn)
    case forgotPassword(path: String = "/auth/forgot-password", email: String)
    case getData(path: String = "/data/get-data")
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.setValue(
            HTTPHeaders.applicationJson.rawValue,
            forHTTPHeaderField: HTTPHeaders.contentType.rawValue
        )
        return request
    }
    private var url: URL? {
        var components = URLComponents()
        components.scheme = WebSite.scheme
        components.host = WebSite.baseURL
        components.port = WebSite.port
        components.path = self.path
        return components.url
    }
    private var path: String {
        switch self {
        case .createAccount(let path, _),
                .signIn(let path, _),
                .forgotPassword(let path, _),
                .getData(let path):
            return path
        }
    }
    private var httpMethod: String {
        switch self {
        case .getData: return HTTPMethod.GET.rawValue
        default: return HTTPMethod.POST.rawValue
        }
    }
    private var httpBody: Data? {
        switch self {
        case .createAccount(_, let userRequest):
            return try? JSONEncoder().encode(userRequest)
        case .signIn(_, let userRequest):
            return try? JSONEncoder().encode(userRequest)
        case .forgotPassword(_, let email):
            return try? JSONSerialization.data(withJSONObject: ["email": email], options: [])
        case .getData:
            return nil
        }
    }
}
