//
//  LoginViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation
import UIKit

protocol ILoginViewModel: IBaseViewModel {
    var currentLoginType: LoginType { get }
    func textFieldShouldReturn(_ view: UIView)
    func toggleCurrentLoginType()
}
class LoginViewModel: ILoginViewModel {
    var title: String?
    var presentHandler: ((UIViewController, Bool) -> Void)?
    private var loginType: LoginType
    var currentLoginType: LoginType {
        loginType
    }
    init(title: String? = nil, currentLoginType: LoginType) {
        self.title = title
        self.loginType = currentLoginType
    }
    
    func toggleCurrentLoginType() { loginType.toggle() }
    func textFieldShouldReturn(_ view: UIView) { view.endEditing(true) }
}
