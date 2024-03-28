//
//  NotesViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation

class NotesViewModel: INotesViewModel {
    typealias Person = Note.Person
    struct Note {
        struct Person {
            let name: String
            let surname: String
            let username: String
            let image: Data?
            let link: URL
            var fullName: String { name + " " + surname }
        }
        let person: Person
        let likeCount: Int
        let content: Data
        let text: String
    }
    
    var title: String?
    private(set) var items: [Note]
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil, items: [Note] ) {
        self.title = title
        self.items = items
        if items.isEmpty {
            for i in 0..<10 {
                let personi = Person(
                    name: "name_\(i)",
                    surname: "surname_\(i)",
                    username: "person_\(i)",
                    image: nil,
                    link: URL(fileURLWithPath: "person\(i)")
                )
                let item = Note(
                    person: personi,
                    likeCount: 1,
                    content: Data(),
                    text: "some text from person\(i). And more more text from other users with a lot of charactrs"
                )
                self.items.append(item)
            }
        }
    }
    func item(for indexPath: IndexPath) -> Note { items[indexPath.row] }
}
