import UIKit
import UIComponents

class ProfileViewModel: IProfileViewModel {
    
    var title: String?
    var navigationDelegate: ViewModelNavigationDelegate?
    
    init(title: String? = nil) {
        self.title = title
    }
}
