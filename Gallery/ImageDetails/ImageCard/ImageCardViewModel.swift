//
//  ImageCardViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 5.01.24.
//

import Foundation

final class ImageCardViewModel: ImageCardViewModeling {
    var id: String
    var url: URL
    var descriptionText: String
    
    init(id: String, url: URL, descriptionText: String) {
        self.id = id
        self.url = url
        self.descriptionText = descriptionText
    }
}
