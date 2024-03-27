//
//  TabBarController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

final class TabBarController: UITabBarController {
    enum Tabs: Int, CaseIterable {
        case notes
        case map
        case friends
        case profile
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureAppearance()
        switchTo(tab: .profile)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func switchTo(tab: Tabs) { selectedIndex = tab.rawValue }
    private func configureAppearance() {
        tabBar.tintColor = App.Color.label
        tabBar.unselectedItemTintColor = App.Color.secondaryLabel
        tabBar.backgroundColor = App.Color.systemBackground
        tabBar.addBottomBorder(with: App.Color.separator, height: 2/3)
        let images = [
            App.Image.notes, App.Image.map, App.Image.friends, App.Image.profile
        ]
        let selectedImages = [
            App.Image.notesFill, App.Image.mapFill, App.Image.friendsFill, App.Image.profileFill
        ]
        let titles = [
            App.string.notes(), App.string.map(), App.string.friends(), App.string.profile()
        ]
        let controllers: [NavigationController] = Tabs.allCases.map { tab in
            let controller = NavigationController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: titles[tab.rawValue],
                                                 image: images[tab.rawValue],
                                                 selectedImage: selectedImages[tab.rawValue])
            controller.navigationBar.addTopBorder(with: App.Color.separator, height: 1)
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    
    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .notes:
            let viewModel = NotesViewModel(
                title: "Notes",
                items: [],
                lineSpacing: 8,
                headerSize: CGSize(width: 300, height: 32)
            )
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0
            return NotesViewController(viewModel: viewModel, layout: layout)
        case .map:
            let viewModel = MapViewModel(title: "Map")
            return MapViewController(viewModel: viewModel)
        case .friends:
            let viewModel = FriendsViewModel(title: "Friends", friends: [])
            return FriendsViewController(viewModel: viewModel)
        case .profile:
            let viewModel = ProfileViewModel(title: "Profile")
            return ProfileViewController(viewModel: viewModel)
        }
    }
}
