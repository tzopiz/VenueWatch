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
    var presentHandler: ((UIViewController, Bool) -> Void)?
    
    init(title: String? = nil, presentHandler: ((UIViewController, Bool) -> Void)? = nil) {
        self.title = title
        self.presentHandler = presentHandler
    }
}
