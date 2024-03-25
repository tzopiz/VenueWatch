//
//  UICollectionView + ext.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

extension UICollectionView {
    func registerCells(_ cells: UICollectionViewCell.Type...) {
        cells.forEach { cell in
            register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
        }
    }
}
