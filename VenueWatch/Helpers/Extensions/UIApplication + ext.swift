//
//  UIApplication + ext.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

extension UIApplication {
    var keyWindow: UIWindow? {
        return self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    var topViewController: UIViewController? {
        var top = keyWindow?.rootViewController
        while true {
            if let presented = top?.presentedViewController { top = presented }
            else if let nav = top as? UINavigationController { top = nav.visibleViewController }
            else if let tab = top as? UITabBarController { top = tab.selectedViewController }
            else { break }
        }
        return top
    }
}
