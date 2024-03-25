//
//  CollectionViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

protocol ICollectionViewModel: IBaseViewModel {
    associatedtype ItemType
    var items: [ItemType] { get }
    var lineSpacing: CGFloat { get }
    var headerSize: CGSize { get }
    func configureCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    
}
extension ICollectionViewModel {
    func minimumLineSpacing(at section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func referenceSizeForHeader(at section: Int) -> CGSize {
        return headerSize
    }
}

class CollectionViewModel: ICollectionViewModel {
    var lineSpacing: CGFloat
    var headerSize: CGSize
    var presentHandler: ((UIViewController, Bool) -> Void)?
    func configureCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? LabelCollectionViewCell else { return }
        let title = items[indexPath.row]
        cell.configure(title)
    }
    
    typealias ItemType = String
    var items: [String]
    var title: String?
    init(
        items: [String], title: String? = nil,
        lineSpacing: CGFloat = 8,
        headerSize: CGSize = CGSize(width: 300, height: 32)
    ) {
        self.items = items
        self.title = title
        self.lineSpacing = lineSpacing
        self.headerSize = headerSize
    }
}
