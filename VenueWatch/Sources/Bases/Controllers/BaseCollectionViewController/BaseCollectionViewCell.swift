//
//  BaseCellView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

protocol IConfigurable {
    func configure(_ parametrs: Any...)
}
class BaseCollectionViewCell: UICollectionViewCell, IConfigurable {
    
    override class var reuseIdentifier: String { String(describing: BaseCollectionViewCell.self) }
    
    init() {
        super.init(frame: .zero)
        setupViews()
        layoutViews()
        configureViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ parametrs: Any...) { }
}

// MARK: - Configure
@objc
extension BaseCollectionViewCell {
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
