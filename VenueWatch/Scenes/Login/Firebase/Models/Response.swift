//
//  Response.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import Foundation

enum Response {
    struct Success: Decodable {
        let success: String
    }
    struct Error: Decodable {
        let error: String
    }
}
