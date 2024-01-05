//
//  ImageDetailsViewModeling.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import Foundation

protocol ImageDetailsViewModeling: AnyObject {
    var galleryElements: [GalleryElement] { get }
    var currentElementIndex: Int { get }
    
    func didScrolled(to index: Int)
    func createImageCards() -> [ImageCardView]
}
