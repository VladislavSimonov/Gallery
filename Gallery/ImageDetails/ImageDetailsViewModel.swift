//
//  ImageDetailsViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import Foundation

final class ImageDetailsViewModel: ImageDetailsViewModeling {
    private let storage: StorageServiceProtocol
    var galleryElements: [GalleryElement] = []
    var currentElementIndex: Int
    
    init(galleryElements: [GalleryElement],
         selectedElementIndex: Int,
         storage : StorageServiceProtocol) {
        self.galleryElements = galleryElements
        self.currentElementIndex = selectedElementIndex
        self.storage = storage
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
                    self.storage.faivoriteImagesSet.remove(galleryElement.id)
                } else {
                    self.storage.faivoriteImagesSet.insert(galleryElement.id)
                }
            }
            
            imageCards.append(ImageCardView(viewModel: viewModel))
        }
        
        return imageCards
    }
}
