//
//  NotesCollectionViewCell.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation

class NotesCollectionViewCell: BaseCollectionViewCell {
    override func configure(_ parametrs: Any...) {
        parametrs.forEach { parametr in
            print(parametr)
        }
    }
}
