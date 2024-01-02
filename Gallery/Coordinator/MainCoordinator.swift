//
//  MainCoordinator.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToImageGalleryController()
    }
    
    func goToImageGalleryController() {
        let imageGalleryViewModel = ImageGalleryViewModel(coordinator: self)
        let imageGalleryViewController = ImageGalleryViewController(viewModel: imageGalleryViewModel)
        navigationController.pushViewController(imageGalleryViewController, animated: true)
    }
    
    func goToImageDetailsController() {
        let controller = ImageDetailsViewController(viewModel: ImageDetailsViewModel())
        navigationController.pushViewController(controller, animated: true)
    }
}
