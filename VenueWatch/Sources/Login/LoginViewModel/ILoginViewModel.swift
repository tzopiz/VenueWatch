//
//  ILoginViewModel.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import Foundation

protocol ILoginViewModel: IBaseViewModel {
    var currentLoginType: LoginType { get }
    var appleLoginService: AppleLoginService { get }
    var authService: AuthService { get }
    var loginTypeChanged: ((LoginType) -> Void)? { get set }
    func toggleCurrentLoginType()
}
