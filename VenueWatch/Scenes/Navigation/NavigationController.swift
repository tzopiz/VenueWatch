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
        view.backgroundColor = App.color.systemBackground
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: App.color.secondaryLabel,
            .font: App.font.rubik(style: .regular, size: 20)!
        ]
    }
}

extension UINavigationController {
    func presentLoginViewController(for type: LoginType) {
        let loginViewController = LoginViewController(currentLoginType: type)
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
