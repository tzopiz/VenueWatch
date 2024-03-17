//
//  BaseViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

class BaseViewController: UIViewController {
    enum NavBarPosition {
        case left
        case right
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureViews()
    }
}

// MARK: - Configure
@objc
extension BaseViewController {
    /// Добавляет подвиды на контроллер.
    /// Добавьте код для добавления подвидов на контроллер,
    /// таких как их инициализация, настройка свойств и добавление на представление.
    func setupViews() { }
    
    /// Устанавливает ограничения для подвидов внутри контроллера.
    /// Добавьте код для установки ограничений для подвидов,
    /// таких как установка автолейаут-ограничений, задание отступов и т.д.
    func layoutViews() { }
    
    /// Настраивает внешний вид контроллера.
    /// Добавьте код для настройки внешнего вида контроллера,
    /// таких как установка фона, цветов, шрифтов и других свойств визуальных элементов.
    /// Вы также можете применять стили, добавлять тени, закруглять углы и т.д.
    func configureViews() {
        view.backgroundColor = R.color.background()
        navigationController?.navigationBar.addBottomBorder(with: R.color.border(), height: 1)
    }
}

extension BaseViewController {
    func addNavBarButton(at position: NavBarPosition,
                         with title: String? = nil,
                         image: UIImage? = nil) {
        let button = UIButton(type: .system)
        if let title = title { button.setTitle(title, for: .normal) }
        if let image = image { button.setImage(image, for: .normal) }
        button.titleLabel?.font = R.font.rubikRegular(size: 17)!
        
        switch position {
        case .left:
            button.addTarget(
                self,
                action: #selector(navBarLeftButtonHandler),
                for: .touchUpInside
            )
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(
                self,
                action: #selector(navBarRightButtonHandler),
                for: .touchUpInside
            )
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    @IBAction func navBarLeftButtonHandler() { }
    @IBAction func navBarRightButtonHandler() { }
}