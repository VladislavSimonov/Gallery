//
//  ImageGalleryViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import Foundation

final class ImageGalleryViewModel: ImageGalleryViewModeling {
    
    weak var coordinator: MainCoordinator?
    var galleryElements: [GalleryElement] = []
    var needReloadCollectionView: (() -> Void)?
    
    private let networkingManager: NetworkingManagerProtocol
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.networkingManager = NetworkingManager()
    }
    
    func goToDetails() {
        coordinator?.goToImageDetailsController()
    }
    
    func getGalleryElement() {
        networkingManager.request(endpoint: GalleryAPI.listPhotos) { [weak self] (result: Result<[GalleryElement], NetworkingError>) in
            switch result {
            case .success(let galleryElements):
                self?.galleryElements = galleryElements
                self?.needReloadCollectionView?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
