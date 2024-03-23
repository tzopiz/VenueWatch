//
//  Service.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

protocol Service {
    associatedtype ServiceResult
    func fetch(request: URLRequest)  async throws -> ServiceResult
}
