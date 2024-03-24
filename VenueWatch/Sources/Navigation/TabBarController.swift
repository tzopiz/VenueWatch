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
        tabBar.tintColor = App.color.label
        tabBar.unselectedItemTintColor = App.color.secondaryLabel
        tabBar.backgroundColor = App.color.systemBackground
        tabBar.addTopBorder(with: App.color.separator, height: 2/3)
        
        let images = [
            App.images.notes,
            App.images.map,
            App.images.friends,
            App.images.profile,
        ]
        let selectedImages = [
            App.images.notes_fill,
            App.images.map_fill,
            App.images.friends_fill,
            App.images.profile_fill,
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
            controller.navigationBar.addBottomBorder(with: App.color.separator, height: 1)
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
