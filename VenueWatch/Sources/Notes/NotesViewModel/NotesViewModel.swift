//
//  NotesViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation

final class NotesViewModel: INotesViewModel {
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
            let text = "Some text of person. And more more text from other users with a lot of charactrs"
            for i in 1...25 {
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
                    content: App.Image.testImages.randomElement()!?.pngData() ?? Data(),
                    text: Array<String>(repeating: text, count: Int.random(in: 2..<50)).joined()
                )
                self.items.append(item)
            }
        }
    }
    func item(for indexPath: IndexPath) -> Note { items[indexPath.row] }
}
