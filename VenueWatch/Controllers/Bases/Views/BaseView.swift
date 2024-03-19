//
//  BaseView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import UIKit

public class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
        configureViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Configure
@objc
extension BaseView {
    /// Добавляет подвиды на представление.
    /// Добавьте код для добавления подвидов на представление,
    /// таких как их инициализация, настройка свойств и добавление на представление.
    func setupViews() { }
    
    /// Устанавливает ограничения для подвидов внутри представления.
    /// Добавьте код для установки ограничений для подвидов,
    /// таких как установка автолейаут-ограничений, задание отступов и т.д.
    func layoutViews() { }
    
    /// Настраивает внешний вид представления.
    /// Добавьте код для настройки внешнего вида представления,
    /// таких как установка фона, цветов, шрифтов и других свойств визуальных элементов.
    /// Вы также можете применять стили, добавлять тени, закруглять углы и т.д.
    func configureViews() { }
}

extension BaseView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
