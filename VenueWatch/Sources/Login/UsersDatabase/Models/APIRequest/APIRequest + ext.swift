import Foundation

extension APIRequest {
    enum HTTPMethod: String {
        case GET
        case POST
    }
    enum HTTPHeaders: String {
        case contentType = "Content-Type"
        case applicationJson = "application/json"
    }
    enum ServiceError: Error {
        case server(String)
        case unknown(String = "An unknown error occured.")
        case decoding(String = "Error parsing server response.")
    }
    struct WebSite {
        static let scheme = "http"
        static let baseURL = "localhost"
        static let port: Int? = 5000
        static let fullURL = "http://localhost:5000/"
    }
}
