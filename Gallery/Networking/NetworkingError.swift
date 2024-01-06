//
//  NetworkingError.swift
//  Gallery
//
//  Created by Vladislav Simonov on 3.01.24.
//

import Foundation

enum NetworkingError: Error {
    case invalidURL
    case unableToComplete
    case invalidData
    case invalidResponse
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL address is invalid."
        case .unableToComplete:
            return "Unable to complete your request. Please check your internet connection."
        case .invalidData:
            return "The data received from the server was invalid."
        case .invalidResponse:
            return "Invalid response from the server."
        }
    }
}
