//
//  API.swift
//  Gallery
//
//  Created by Vladislav Simonov on 3.01.24.
//

import Foundation

protocol API {
    var scheme: HTTPScheme { get }
    var method: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }
    var apiParameters: [URLQueryItem] { get }
}
