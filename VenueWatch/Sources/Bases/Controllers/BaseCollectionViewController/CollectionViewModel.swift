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
    func item(for indexPath: IndexPath) -> ItemType
}
class CollectionViewModel: ICollectionViewModel {
    var title: String?
    private(set) var items: [String]
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil, items: [String]) {
        self.items = items
        self.title = title
    }
    func item(for indexPath: IndexPath) -> ItemType { items[indexPath.row] }
}
