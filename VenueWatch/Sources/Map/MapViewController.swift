//
//  MapViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class MapViewController: BaseViewController { }

// MARK: - Configure
extension MapViewController {
    override func configureViews() {
        super.configureViews()
        navigationItem.title = App.string.map()
    }
}
