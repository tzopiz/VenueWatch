//
//  CollectionViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit
import SnapKit

class CollectionViewController: BaseViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
}

// MARK: - Configure
extension CollectionViewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(collectionView)
    }
    override func layoutViews() {
        super.layoutViews()
        collectionView.snp.makeConstraints { $0.leading.trailing.top.bottom.equalToSuperview() }
    }
    override func configureViews() {
        super.configureViews()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = R.color.background()
        let refreshControl = UIRefreshControl()
        collectionView.refreshControl = refreshControl
        let refreshAction = UIAction { action in
            self.refreshData()
        }
        collectionView.refreshControl?.addAction(refreshAction, for: .valueChanged)
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int)
    -> Int { 0 }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell { UICollectionViewCell() }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDelegate { }

//MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int)
    -> CGFloat { 8 }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int)
    -> CGSize { CGSize(width: collectionView.frame.width, height: 32) }
}

// MARK: - UICollectionViewUpdatable
protocol UICollectionViewUpdatable: AnyObject {
    func refreshData()
}

extension CollectionViewController: UICollectionViewUpdatable {
    func refreshData() {
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.beginRefreshing()
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
}