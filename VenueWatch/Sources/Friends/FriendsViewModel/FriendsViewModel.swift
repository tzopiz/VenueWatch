//
//  FriendsViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

class FriendsViewModel: IFriendsViewModel {
    struct Friend {
        var name: String
        var surname: String
        var photo: String
    }
    
    var title: String?
    var friends: Array<Friend>
    var presentHandler: ((UIViewController, Bool) -> Void)?
    
    init(title: String? = nil, friends: Array<Friend>) {
        self.title = title
        self.friends = friends
    }
}
