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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func switchTo(tab: Tabs) { selectedIndex = tab.rawValue }
    
    private func configureAppearance() {
        tabBar.tintColor = App.color.accentColor()
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .systemBackground
        tabBar.addTopBorder(with: App.color.border(), height: 2/3)
        
        let images = [
            UIImage(systemName: "note.text"),
            UIImage(systemName: "map"),
            UIImage(systemName: "person.2.wave.2.fill"),
            UIImage(systemName: "person.crop.rectangle.stack")
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
                                                 tag: tab.rawValue)
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

