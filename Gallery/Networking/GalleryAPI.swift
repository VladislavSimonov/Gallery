//
//  GalleryAPI.swift
//  Gallery
//
//  Created by Vladislav Simonov on 3.01.24.
//

import Foundation

enum GalleryAPI: API {
    
    case listPhotos
    
    var scheme: HTTPScheme {
        switch self {
        case .listPhotos:
            return .https
        }
    }
    var method: HTTPMethod {
        switch self {
        case .listPhotos:
            return .get
        }
    }
    var baseURL: String {
        switch self {
        case .listPhotos:
            return "api.unsplash.com"
        }
    }
        
    var path: String {
        switch self {
        case .listPhotos:
            return "/photos/"
        }
    }
        
    var apiParameters: [URLQueryItem] {
        switch self {
        case .listPhotos:
            return [
                URLQueryItem(name: "client_id", value: "uk8h2ufbP7JSFCkTGrAdKJCqb-SfK2NXQjmIlhsVMiM")]
        }
    }
}
