//
//  UIView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

extension UIView {
    /// Добавляет верхнюю границу с указанным цветом и высотой к текущему представлению.
    /// - Parameters:
    ///   - color: Цвет верхней границы.
    ///   - height: Высота верхней границы.
    func addTopBorder(with color: UIColor?, height: CGFloat) {
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
    /// Добавляет нижнюю границу с указанным цветом и высотой к текущему представлению.
    /// - Parameters:
    ///   - color: Цвет нижней границы.
    ///   - height: Высота нижней границы.
    func addBottomBorder(with color: UIColor?, height: CGFloat) {
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
    /// Добавляет указанные представления в качестве дочерних к текущему представлению.
    ///
    /// - Parameter views: Представления, которые нужно добавить в качестве дочерних.
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    ///
    ///
    ///
    func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
