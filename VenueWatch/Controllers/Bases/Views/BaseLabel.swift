//
//  BaseLabel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import UIKit

///
/// ```swift
/// // by defaults:
/// self.numberOfLines = 0
/// self.textColor = App.color.label,
/// self.fontSize = 15
/// self.textAlignment = .left
/// self.lineBreakMode = .byWordWrapping
/// ```
public class BaseLabel: UILabel {
    enum FontType {
        case italic, light, regular, bold
    }
    init(text: String? = nil,
         textColor: UIColor? = App.color.label,
         fontSize: CGFloat = 15,
         fontType: FontType = .regular,
         textAlignment: NSTextAlignment = .left,
         lineBreakMode: NSLineBreakMode = .byWordWrapping) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.lineBreakMode = lineBreakMode
        self.textColor = textColor
        switch fontType {
        case .italic: self.font = App.font.rubikItalic(size: fontSize)
        case .light: self.font = App.font.rubikLight(size: fontSize)
        case .regular: self.font = App.font.rubikRegular(size: fontSize)
        case .bold: self.font = App.font.rubikBold(size: fontSize)
        }
        self.text = text
        self.numberOfLines = 0
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
extension BaseLabel {
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
