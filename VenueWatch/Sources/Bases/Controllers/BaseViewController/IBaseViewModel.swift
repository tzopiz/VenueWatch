//
//  BaseViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import UIKit

protocol IBaseViewModel {
    var title: String? { get }
    // FIXME: - Antipattern
    var presentHandler: ((UIViewController, Bool) -> Void)? { get set }
}
