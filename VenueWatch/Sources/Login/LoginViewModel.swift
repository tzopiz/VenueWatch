//
//  LoginViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import Foundation
import UIKit

protocol ILoginViewModel: IBaseViewModel {
    func textFieldShouldReturn(_ view: UIView)
    var currentLoginType: LoginType { get }
    func toggleCurrentLoginType()
}
class LoginViewModel: ILoginViewModel {
    func toggleCurrentLoginType() {
        loginType.toggle()
    }
    func textFieldShouldReturn(_ view: UIView) {
        view.endEditing(true)
    }
    var presentHandler: ((UIViewController, Bool) -> Void)?
    var title: String?
    internal var loginType: LoginType
    var currentLoginType: LoginType {
        loginType
    }
    init(title: String? = nil, currentLoginType: LoginType) {
        self.title = title
        self.loginType = currentLoginType
    }
}
