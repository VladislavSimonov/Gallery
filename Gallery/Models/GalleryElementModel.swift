//
//  GalleryElementModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 3.01.24.
//

import Foundation

struct GalleryElement: Codable {
    let id: String
    let description: String?
    let urls: Urls
    
    var isLiked: Bool?
}

struct Urls: Codable {
    let regular: String
    let small: String
}
