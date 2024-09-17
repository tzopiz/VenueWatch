import Foundation
import UIComponents

final class MapViewModel: IMapViewModel {
    var title: String?
    var navigationDelegate: ViewModelNavigationDelegate?
    init(title: String? = nil) {
        self.title = title
    }
}
