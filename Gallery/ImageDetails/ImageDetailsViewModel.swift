//
//  ImageDetailsViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import Foundation

typealias ImageDetailsViewModelContext = StorageProviderProtocol

final class ImageDetailsViewModel<Context: ImageDetailsViewModelContext>: ImageDetailsViewModeling {
    private let context: Context
    var galleryElements: [GalleryElement] = []
    var currentElementIndex: Int
    
    init(galleryElements: [GalleryElement],
         selectedElementIndex: Int,
         context: Context) {
        self.galleryElements = galleryElements
        self.currentElementIndex = selectedElementIndex
        self.context = context
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
                                               descriptionText: galleryElement.description ?? "",
                                               isPhotoLiked: galleryElement.isLiked ?? false)
            
            viewModel.likeButtonDidTouch = {
                if galleryElement.isLiked == true {
                    self.context.storage.removeFromFavourites(galleryElement.id)
                } else {
                    self.context.storage.addToFavourites(galleryElement.id)
                }
            }
            
            imageCards.append(ImageCardView(viewModel: viewModel))
        }
        
        return imageCards
    }
}
