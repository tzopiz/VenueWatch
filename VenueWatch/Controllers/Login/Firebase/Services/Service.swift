//
//  Service.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

protocol ServiceDelegate {
    associatedtype ServiceResult
    func fetch(request: URLRequest)  async throws -> ServiceResult
}

class Service: ServiceDelegate {
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
    func fetch(request: URLRequest) async throws -> Void { }
}
