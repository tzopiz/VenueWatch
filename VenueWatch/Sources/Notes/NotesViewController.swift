//
//  NotesViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class NotesViewController: BaseCollectionViewController<NotesViewModel, NotesCollectionViewCell> {
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: NotesCollectionViewCell.self),
            for: indexPath
        ) as? NotesCollectionViewCell
        else { return UICollectionViewCell() }
        let item = viewModel.item(for: indexPath)
        cell.configure(item)
        return cell
    }

    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
    }
    override func layoutViews() {
        super.layoutViews()
    }
    override func configureViews() {
        super.configureViews()
        // FIXME: - Scrolling lags
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
}
