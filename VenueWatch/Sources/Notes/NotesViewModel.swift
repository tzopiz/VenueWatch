//
//  NotesViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

protocol INotesViewModel: ICollectionViewModel { }
class NotesViewModel: INotesViewModel {
    var title: String?
    var items: [Note] = []
    var lineSpacing: CGFloat
    var headerSize: CGSize
    var presentHandler: ((UIViewController, Bool) -> Void)?

    typealias ItemType = Note
    struct Note {
        struct Person {
            var name: String
            var surname: String
            var username: String
            var profilePhoto: UIImage
        }
        let person: Person
        let likeCount: Int
        let content: UIView
    }
    
    func configureCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? NotesCollectionViewCell else { return }
        cell.configure(String(indexPath.row))
    }
    init(
        title: String? = nil,
        items: [Note],
        lineSpacing: CGFloat,
        headerSize: CGSize
    ) {
        self.title = title
        self.items = items
        self.lineSpacing = lineSpacing
        self.headerSize = headerSize
    }
}
