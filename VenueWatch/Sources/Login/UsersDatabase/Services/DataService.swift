//
//  DataService.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

final class DataService: Service {
    typealias ServiceError = APIRequest.ServiceError
    func fetch(request: URLRequest) async throws -> [String] {
        guard let request = APIRequest.getData().request
        else { throw ServiceError.unknown("Invalid request") }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else { throw ServiceError.server("Server error: \(response)") }
        let decoder = JSONDecoder()
        do {
            let array = try decoder.decode(Array<String>.self, from: data)
            return array
        } catch {
            do {
                let errorMessage = try decoder.decode(Response.Error.self, from: data)
                throw ServiceError.server(errorMessage.error)
            } catch {
                throw ServiceError.decoding("Error parsing server response: \(error)")
            }
        }
    }
}