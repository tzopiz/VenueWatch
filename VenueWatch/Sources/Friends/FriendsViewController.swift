import UIKit
import UIComponents

final class FriendsViewController: BaseViewController<FriendsViewModel> {
    override func configureViews() {
        super.configureViews()
        navigationItem.title = viewModel.title
    }
}
