//
//  BaseViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import Foundation

protocol IBaseViewModel {
    var title: String? { get }
    var navigationDelegate: ViewModelNavigationDelegate? { get set }
}
