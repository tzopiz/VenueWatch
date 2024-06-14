//
//  Tabs.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 6/14/24.
//

import UIKit
import UIComponents

final class DDTabBarController: TabBarController {
    init() {
        super.init(tabs: Tabs.getAllTabs())
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DDTabBarController {
    enum Tabs: Int, CaseIterable {
        case notes, map, friends, profile

        static func getAllTabs() -> [Tab] {
            let images = [
                App.Image.notes, App.Image.map, App.Image.friends, App.Image.profile
            ]
            let selectedImages = [
                App.Image.notesFill, App.Image.mapFill, App.Image.friendsFill, App.Image.profileFill
            ]
            let titles = [
                App.string.notes(), App.string.map(), App.string.friends(), App.string.profile()
            ]

            return Tabs.allCases.enumerated().map { index, tab in
                let viewController = createViewController(for: tab, title: titles[tab.rawValue])
                return Tab(
                    title: titles[index], image: images[index],
                    selectedImage: selectedImages[index],
                    viewController: viewController
                )
            }
        }

        private static func createViewController(for tab: Tabs, title: String) -> UIViewController {
            switch tab {
            case .notes:
                let layout = UICollectionViewFlowLayout()
                return NotesViewController(viewModel: NotesViewModel(title: title, items: []), layout: layout)
            case .map:
                return MapViewController(viewModel: MapViewModel(title: title))
            case .friends:
                return FriendsViewController(viewModel: FriendsViewModel(title: title, friends: []))
            case .profile:
                return ProfileViewController(viewModel: ProfileViewModel(title: title))
            }
        }
    }
}
