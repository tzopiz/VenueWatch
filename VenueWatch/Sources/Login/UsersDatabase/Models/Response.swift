import Foundation

enum Response {
    struct Success: Decodable {
        let success: String
    }
    struct Error: Decodable {
        let error: String
    }
}
