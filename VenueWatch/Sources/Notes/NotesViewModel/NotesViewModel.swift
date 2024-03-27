//
//  NotesViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation

class NotesViewModel: INotesViewModel {
    struct Note {
        struct Person {
            var name: String
            var surname: String
            var username: String
        }
        let person: Person
        let likeCount: Int
        let link: URL
    }
    
    var title: String?
    private(set) var items: [Note]
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil, items: [Note] ) {
        self.title = title
        self.items = items
    }
    
    func item(for indexPath: IndexPath) -> Note { items[indexPath.row] }
}
