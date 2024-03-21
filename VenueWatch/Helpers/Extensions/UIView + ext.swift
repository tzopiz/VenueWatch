//
//  UIView + ext.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor?, height: CGFloat) {
        guard let color = color else { return }
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [
            .flexibleHeight, .flexibleBottomMargin,
            .flexibleTopMargin, .flexibleWidth
        ]
        separator.frame = CGRect(
            x: 0, y: frame.height - height,
            width: frame.width, height: height
        )
        addSubview(separator)
    }
    func addTopBorder(with color: UIColor?, height: CGFloat) {
        guard let color = color else { return }
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [
            .flexibleHeight, .flexibleBottomMargin,
            .flexibleTopMargin, .flexibleWidth
        ]
        separator.frame = CGRect(
            x: 0, y: 0,
            width: frame.width, height: height
        )
        addSubview(separator)
    }
}

