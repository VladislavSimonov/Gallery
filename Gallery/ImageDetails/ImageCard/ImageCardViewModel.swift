//
//  ImageCardViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 5.01.24.
//

import Foundation

final class ImageCardViewModel: ImageCardViewModeling {
    var url: URL
    var descriptionText: String
    var likeByUser: Bool
    
    init(url: URL, descriptionText: String, likeByUser: Bool) {
        self.url = url
        self.descriptionText = descriptionText
        self.likeByUser = likeByUser
    }
}
