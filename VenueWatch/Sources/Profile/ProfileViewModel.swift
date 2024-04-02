//
//  ProfileViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

protocol IProfileViewModel: IBaseViewModel { }
class ProfileViewModel: IProfileViewModel {
    
    var title: String?
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil) {
        self.title = title
    }
}
