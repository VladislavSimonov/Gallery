//
//  GalleryAPI.swift
//  Gallery
//
//  Created by Vladislav Simonov on 3.01.24.
//

import Foundation

final class GalleryAPI: API {
    var scheme: HTTPScheme = .https
    var method: HTTPMethod = .get
    var baseURL: String = "api.unsplash.com"
    var path: String = "/photos/"
    var apiParameters: [URLQueryItem]
    
    init(page: String) {
        apiParameters = [
            URLQueryItem(name: "client_id", value: "uk8h2ufbP7JSFCkTGrAdKJCqb-SfK2NXQjmIlhsVMiM"),
            URLQueryItem(name: "page", value: page),
            URLQueryItem(name: "per_page", value: "30")
        ]
    }
}
