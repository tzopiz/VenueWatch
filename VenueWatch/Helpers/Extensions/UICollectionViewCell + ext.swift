//
//  UICollectionViewCell + ext.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

protocol IReusableCell {
    static var reuseIdentifier: String { get }
}
extension UICollectionViewCell: IReusableCell {
    @objc class var reuseIdentifier: String { String(describing: UICollectionViewCell.self) }
}
