//
//  NotesViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

class NotesViewModel: INotesViewModel {
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
    
    var title: String?
    var items: [Note]
    var lineSpacing: CGFloat
    var headerSize: CGSize
    var presentHandler: ((UIViewController, Bool) -> Void)?
    
    init(
        title: String? = nil,
        items: [Note],
        lineSpacing: CGFloat = 8,
        headerSize: CGSize = CGSize(width: 300, height: 32)
    ) {
        self.title = title
        self.items = items
        self.lineSpacing = lineSpacing
        self.headerSize = headerSize
    }
    
    func configureCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? NotesCollectionViewCell else { return }
        cell.configure(String(indexPath.row))
    }
}
