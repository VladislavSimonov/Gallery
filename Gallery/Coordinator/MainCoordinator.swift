//
//  MainCoordinator.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

protocol ImageDetailsCoordinator: AnyObject {
    func goToImageDetailsController(with elements: [GalleryElement], selectedElementIndex: Int)
}

class MainCoordinator: Coordinator, ImageDetailsCoordinator {
    
    var navigationController: UINavigationController
    private let storage: StorageServiceProtocol
    
    init(navigationController: UINavigationController, storage: StorageServiceProtocol) {
        self.navigationController = navigationController
        self.storage = storage
    }
    
    func start() {
        goToImageGalleryController()
    }
    
    private func goToImageGalleryController() {
        let imageGalleryViewModel = ImageGalleryViewModel(coordinator: self, storage: storage)
        let imageGalleryViewController = ImageGalleryViewController(viewModel: imageGalleryViewModel)
        navigationController.pushViewController(imageGalleryViewController, animated: true)
    }
    
    func goToImageDetailsController(with elements: [GalleryElement], selectedElementIndex: Int) {
        let imageDetailsViewModel = ImageDetailsViewModel(galleryElements: elements,
                                                          selectedElementIndex: selectedElementIndex,
                                                          storage: storage)
        let imageDetailsViewController = ImageDetailsViewController(viewModel: imageDetailsViewModel)
        navigationController.pushViewController(imageDetailsViewController, animated: true)
    }
}
