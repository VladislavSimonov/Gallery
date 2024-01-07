//
//  ImageGalleryViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import Foundation

typealias ImageGalleryViewModelContext = StorageProviderProtocol & NetworkProviderProtocol

final class ImageGalleryViewModel<Context: ImageGalleryViewModelContext>: ImageGalleryViewModeling {
    
    weak var coordinator: ImageDetailsCoordinator?
    var galleryElements: [GalleryElement] = []
    var needReloadCollectionView: (() -> Void)?
    var showError: ((NetworkingError) -> Void)?
    var hideLoader: (() -> Void)?
    
    private let context: Context
    private var hasNextPage = true
    private var pageNumber: Int = 1
    
    init(coordinator: ImageDetailsCoordinator,
         networkingManager: NetworkingManagerProtocol = NetworkingManager(),
         context: Context) {
        self.coordinator = coordinator
        self.context = context
    }
    
    func tagLikedPhotos() {
        galleryElements = galleryElements.map { mutableElement in
            var element = mutableElement
            element.isLiked = context.storage.isFavourite(element.id)
            return element
        }
    }
    
    func getElementByIndexPath(_ indexPath: IndexPath) -> GalleryElement {
        galleryElements[indexPath.item]
    }
    
    func goToDetails(selectedElementIndex: Int) {
        coordinator?.goToImageDetailsController(with: galleryElements,
                                                selectedElementIndex: selectedElementIndex)
    }
    
    func getGalleryElement() {
        guard hasNextPage else { return }
        
        context.network.request(endpoint: GalleryAPI(page: String(pageNumber))) { [weak self] (result: Result<[GalleryElement], NetworkingError>) in
            self?.hideLoader?()
            
            switch result {
            case .success(var galleryElements):
                guard galleryElements.count > 0 else {
                    self?.hasNextPage = false
                    return
                }
                
                galleryElements = galleryElements.map { mutableElement in
                    var element = mutableElement
                    element.isLiked = self?.context.storage.isFavourite(element.id)
                    return element
                }
                                
                self?.pageNumber += 1
                self?.galleryElements.append(contentsOf: galleryElements)
                self?.needReloadCollectionView?()
            case .failure(let error):
                self?.showError?(error)
            }
        }
    }
}
