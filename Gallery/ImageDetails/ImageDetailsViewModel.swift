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
    
    func createImageCards() -> [ImageCardView] {
        var imageCards: [ImageCardView] = []
        
        for galleryElement in galleryElements {
            guard let url = URL(string: galleryElement.urls.regular) else { continue }
            let viewModel = ImageCardViewModel(url: url,
                                                   descriptionText: galleryElement.description ?? "",
                                                   likeByUser: galleryElement.likedByUser)
            imageCards.append(ImageCardView(viewModel: viewModel))
        }
        
        return imageCards
    }
}
