//
//  MapViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation

class MapViewModel: IMapViewModel {
    var title: String?
    var navigationDelegate: ViewModelNavigationDelegate?
    init(title: String? = nil) {
        self.title = title
    }
}
