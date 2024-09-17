import Foundation
import UIComponents

protocol ILoginViewModel: IBaseViewModel {
    var currentLoginType: LoginType { get }
    var appleLoginService: AppleLoginService { get }
    var authService: AuthService { get }
    var loginTypeChanged: ((LoginType) -> Void)? { get set }
    func toggleCurrentLoginType()
}
