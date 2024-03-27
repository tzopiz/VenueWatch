//
//  IFriendsViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import UIKit

protocol IFriendsViewModel: IBaseViewModel {
    associatedtype ItemType
    var friends: Array<ItemType> { get }
}
