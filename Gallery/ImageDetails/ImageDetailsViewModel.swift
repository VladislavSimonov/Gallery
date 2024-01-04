//
//  ImageDetailsViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import Foundation

final class ImageDetailsViewModel: ImageDetailsViewModeling {
    var galleryElements: [GalleryElement] = []
    var selectedElementIndex: Int
    
    init(galleryElements: [GalleryElement],
         selectedElementIndex: Int) {
        self.galleryElements = galleryElements
        self.selectedElementIndex = selectedElementIndex
    }
}
