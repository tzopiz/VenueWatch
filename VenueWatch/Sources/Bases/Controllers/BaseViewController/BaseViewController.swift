//
//  BaseViewController_2.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

class BaseViewController<ViewModel: IBaseViewModel>: UIViewController {
    enum NavBarPosition {
        case left, right
    }
    
    var viewModel: ViewModel!
    var presentHandler: ((UIViewController, Bool) -> Void)?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureViews()
    }
    
    // MARK: - Configure
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
        navigationItem.title = viewModel.title
        view.backgroundColor = App.Color.secondarySystemBackground
        viewModel.presentHandler = { [weak self] viewController, animated in
            guard let self = self else { return }
            self.present(viewController, animated: animated, completion: nil)
        }
    }
}

// MARK: - Supporting Functions
extension BaseViewController {
    func addNavBarButton(
        at position: NavBarPosition,
        with title: String? = nil,
        image: UIImage? = nil,
        selector: Selector
    ) {
        let button = UIButton(type: .system)
        if let title = title { button.setTitle(title, for: .normal) }
        if let image = image { button.setImage(image, for: .normal) }
        button.titleLabel?.font = App.Font.rubik(style: .regular, size: 17)!
        switch position {
        case .left:
            button.addTarget(self, action: selector, for: .touchUpInside)
            let barButton = UIBarButtonItem(customView: button)
            if navigationItem.leftBarButtonItems != nil {
                navigationItem.leftBarButtonItems?.append(barButton)
            } else { navigationItem.leftBarButtonItem = barButton }
        case .right:
            button.addTarget(self, action: selector, for: .touchUpInside)
            let barButton = UIBarButtonItem(customView: button)
            if navigationItem.rightBarButtonItems != nil {
                navigationItem.rightBarButtonItems?.append(barButton)
            } else { navigationItem.rightBarButtonItem = barButton }
        }
    }
}
