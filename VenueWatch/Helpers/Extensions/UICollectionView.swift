//
//  UICollectionView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

extension UICollectionView {
    /// Регистрирует указанные типы ячеек для использования в коллекции.
    /// - Parameter cells: Типы ячеек, которые необходимо зарегистрировать.
    func registerCells(_ cells: UICollectionViewCell.Type...) {
        cells.forEach { cell in
            register(cell.self, forCellWithReuseIdentifier: cell.reuseIdentifier)
        }
    }
}
