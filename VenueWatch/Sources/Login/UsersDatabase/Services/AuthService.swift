//
//  AuthService.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

final class AuthService: Service {
    typealias ServiceError = APIRequest.ServiceError
    
    // MARK: - Log In
    func fetch(request: URLRequest) async throws -> String {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else { throw ServiceError.server("Server error: \(response)") }
        let decoder = JSONDecoder()
        do {
            let successMessage = try decoder.decode(Response.Success.self, from: data)
            return successMessage.success
        } catch {
            do {
                let errorMessage = try decoder.decode(Response.Error.self, from: data)
                throw ServiceError.server("Response.Error: \(errorMessage.error)")
            } catch {
                throw ServiceError.decoding("Error parsing server response: \(error)")
            }
        }
    }
    
    // MARK: - Sign Out
    func signOut() {
        let url = URL(string: APIRequest.WebSite.fullURL)!
        let cookie = HTTPCookieStorage.shared.cookies(for: url)!.first!
        HTTPCookieStorage.shared.deleteCookie(cookie)
    }
}
