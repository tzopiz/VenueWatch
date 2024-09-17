import Foundation

extension UserDefaults {
    var preferredLanguage: String {
        get { UserDefaults.standard.string(forKey: "preferredLanguage") ?? "eng" }
        set { UserDefaults.standard.set(newValue, forKey: "preferredLanguage") }
    }
}
