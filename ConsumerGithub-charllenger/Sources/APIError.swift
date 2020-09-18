//
//  APIError.swift
//  TopGithub
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    
    var errorMessage: String {
        switch self {
        default:
            return "__fail__"
        }
    }
}
