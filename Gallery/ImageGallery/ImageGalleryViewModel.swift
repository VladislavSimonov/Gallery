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
    private var hasNextPage = true
    private var pageNumber: Int = 1
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.networkingManager = NetworkingManager()
    }
    
    func goToDetails(selectedElementIndex: Int) {
        coordinator?.goToImageDetailsController(with: galleryElements,
                                                selectedElementIndex: selectedElementIndex)
    }
    
    func getGalleryElement() {
        guard hasNextPage else { return }
        
        networkingManager.request(endpoint: GalleryAPI(page: String(pageNumber))) { [weak self] (result: Result<[GalleryElement], NetworkingError>) in
            switch result {
            case .success(let galleryElements):
                self?.pageNumber += 1
                self?.galleryElements.append(contentsOf: galleryElements)
                self?.needReloadCollectionView?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
