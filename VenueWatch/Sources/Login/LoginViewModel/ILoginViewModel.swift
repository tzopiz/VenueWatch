//
//  ILoginViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import UIKit

protocol ILoginViewModel: IBaseViewModel {
    var currentLoginType: LoginType { get }
    var appleLoginService: AppleLoginService { get }
    var authService: AuthService { get }
    func textFieldShouldReturn(_ view: UIView)
    func toggleCurrentLoginType()
    func presentLoginViewController(_ viewController: UINavigationController, for type: LoginType)
}
