//
//  ImageGalleryViewModel.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import Foundation

final class ImageGalleryViewModel: ImageGalleryViewModeling {
    
    weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToDetails() {
        coordinator?.goToImageDetailsController()
    }
}
