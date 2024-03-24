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
        tabBar.addTopBorder(with: App.Color.separator, height: 2/3)
        let images = [
            App.Images.notes,
            App.Images.map,
            App.Images.friends,
            App.Images.profile
        ]
        let selectedImages = [
            App.Images.notesFill,
            App.Images.mapFill,
            App.Images.friendsFill,
            App.Images.profileFill
        ]
        let titles = [
            App.string.notes(),
            App.string.map(),
            App.string.friends(),
            App.string.profile()
        ]
        let controllers: [NavigationController] = Tabs.allCases.map { tab in
            let controller = NavigationController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: titles[tab.rawValue],
                                                 image: images[tab.rawValue],
                                                 selectedImage: selectedImages[tab.rawValue])
            controller.navigationBar.addBottomBorder(with: App.Color.separator, height: 1)
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    private func getController(for tab: Tabs) -> BaseViewController {
        switch tab {
        case .notes:    return NotesViewController()
        case .map:      return MapViewController()
        case .friends:  return FriendsViewController()
        case .profile:  return ProfileViewController()
        }
    }
}
