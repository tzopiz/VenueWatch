import Foundation
import UIComponents

class LoginViewModel: ILoginViewModel {
    var navigationDelegate: ViewModelNavigationDelegate?
    
    var title: String?
    var loginTypeChanged: ((LoginType) -> Void)?
    
    private(set) var currentLoginType: LoginType {
        didSet {
            loginTypeChanged?(currentLoginType)
        }
    }
    
    let appleLoginService = AppleLoginService()
    let authService = AuthService()
    
    init(title: String? = nil, currentLoginType: LoginType) {
        self.title = title
        self.currentLoginType = currentLoginType
    }

    func toggleCurrentLoginType() { currentLoginType.toggle() }
}
