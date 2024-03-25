//
//  FriendsViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class FriendsViewController: BaseViewController<FriendsViewModel> {
    override func configureViews() {
        super.configureViews()
        navigationItem.title = viewModel.title
    }
}
