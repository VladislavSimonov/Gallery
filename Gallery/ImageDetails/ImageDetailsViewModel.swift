//
//  ImageDetailsViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import Foundation

final class ImageDetailsViewModel: ImageDetailsViewModeling {
    var galleryElements: [GalleryElement] = []
    var currentElementIndex: Int
    
    init(galleryElements: [GalleryElement],
         selectedElementIndex: Int) {
        self.galleryElements = galleryElements
        self.currentElementIndex = selectedElementIndex
    }
    
    func didScrolled(to index: Int) {
        currentElementIndex = index
    }
    
    func createImageCards() -> [ImageCardView] {
        var imageCards: [ImageCardView] = []
        
        for galleryElement in galleryElements {
            guard let url = URL(string: galleryElement.urls.regular) else { continue }
            let viewModel = ImageCardViewModel(id: galleryElement.id,
                                               url: url,
                                               descriptionText: galleryElement.description ?? "")
            imageCards.append(ImageCardView(viewModel: viewModel))
        }
        
        return imageCards
    }
}
