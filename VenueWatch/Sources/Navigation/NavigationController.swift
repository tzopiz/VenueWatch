//
//  NavigationController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = App.Color.systemBackground
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: App.Color.secondaryLabel,
            .font: App.Font.rubik(style: .regular, size: 20)!
        ]
    }
}

extension UINavigationController {
    func presentLoginViewController(for type: LoginType) {
        let loginViewModel = LoginViewModel(currentLoginType: type)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        UIView.transition(
            with: view, duration: 0.5,
            options: .transitionFlipFromRight,
            animations: {
                self.viewControllers.removeLast()
                self.viewControllers.append(loginViewController)
        },
            completion: nil)
    }
}
