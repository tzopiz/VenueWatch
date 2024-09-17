import Foundation
import UIComponents

protocol IFriendsViewModel: IBaseViewModel {
    associatedtype ItemType
    var friends: Array<ItemType> { get }
}
