//
//  LoginViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

class LoginViewModel: ILoginViewModel {
    var title: String?
    var presentHandler: ((UIViewController, Bool) -> Void)?
    let appleLoginService = AppleLoginService()
    let authService = AuthService()
    
    private var loginType: LoginType
    var currentLoginType: LoginType {
        loginType
    }
    
    init(title: String? = nil, currentLoginType: LoginType) {
        self.title = title
        self.loginType = currentLoginType
    }

    func toggleCurrentLoginType() { loginType.toggle() }
    func textFieldShouldReturn(_ view: UIView) { view.endEditing(true) }
    func presentLoginViewController(_ viewController: UINavigationController, for type: LoginType) {
        let loginViewModel = LoginViewModel(currentLoginType: type)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        UIView.transition(
            with: viewController.view, duration: 0.5,
            options: .transitionFlipFromRight,
            animations: {
                viewController.viewControllers.removeLast()
                viewController.viewControllers.append(loginViewController)
        }, completion: nil)
    }
}
