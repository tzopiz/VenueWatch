//
//  NotesViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class NotesViewController: CollectionViewController { }

// MARK: - Configure
extension NotesViewController {
    override func configureViews() {
        super.configureViews()
        navigationItem.title = App.string.notes()
    }
}
