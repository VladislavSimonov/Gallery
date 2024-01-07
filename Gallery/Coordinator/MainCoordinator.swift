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

typealias MainCoordinatorContext = ServiceProviderProtocol

final class MainCoordinator<Context: MainCoordinatorContext>: Coordinator, ImageDetailsCoordinator {
    
    var navigationController: UINavigationController
    private let context: Context
    
    init(navigationController: UINavigationController, context: Context) {
        self.navigationController = navigationController
        self.context = context
    }
    
    func start() {
        goToImageGalleryController()
    }
    
    private func goToImageGalleryController() {
        let imageGalleryViewModel = ImageGalleryViewModel(coordinator: self, context: context)
        let imageGalleryViewController = ImageGalleryViewController(viewModel: imageGalleryViewModel)
        navigationController.pushViewController(imageGalleryViewController, animated: true)
    }
    
    func goToImageDetailsController(with elements: [GalleryElement], selectedElementIndex: Int) {
        let imageDetailsViewModel = ImageDetailsViewModel(galleryElements: elements,
                                                          selectedElementIndex: selectedElementIndex,
                                                          context: context)
        let imageDetailsViewController = ImageDetailsViewController(viewModel: imageDetailsViewModel)
        navigationController.pushViewController(imageDetailsViewController, animated: true)
    }
}
