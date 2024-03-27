//
//  ViewModelNavigationDelegate.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import UIKit

protocol ViewModelNavigationDelegate: AnyObject {
    func presentViewController(_ viewController: UIViewController, animated: Bool)
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
}

