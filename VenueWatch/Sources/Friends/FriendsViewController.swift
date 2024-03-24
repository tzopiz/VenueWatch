//
//  FriendsViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class FriendsViewController: BaseViewController { }

// MARK: - Configure
extension FriendsViewController {
    override func setupViews() {
        super.setupViews()
    }
    override func layoutViews() {
        super.layoutViews()
    }
    override func configureViews() {
        super.configureViews()
        navigationItem.title = App.string.friends()
    }
}
