//
//  CollectionViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

class BaseCollectionViewController<ViewModel: ICollectionViewModel, Cell: UICollectionViewCell>: UICollectionViewController where Cell: IReusableCell {

    var viewModel: ViewModel
    
    init(viewModel: ViewModel, layout: UICollectionViewLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
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
        collectionView.registerCells(Cell.self)
        collectionView.backgroundColor = .clear
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.items.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: Cell.self),
            for: indexPath
        ) as! Cell
        viewModel.configureCell(cell, forItemAt: indexPath)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50) // Default cell size
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return viewModel.minimumLineSpacing(at: section)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return viewModel.referenceSizeForHeader(at: section)
    }
}


// MARK: - UICollectionViewUpdatable
protocol ICollectionViewUpdatable: AnyObject {
    func refreshData()
}

extension BaseCollectionViewController: ICollectionViewUpdatable {
    func refreshData() {
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.beginRefreshing()
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
}
