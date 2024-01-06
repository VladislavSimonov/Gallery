//
//  ImageGalleryViewModeling.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import Foundation

protocol ImageGalleryViewModeling: AnyObject {
    var galleryElements: [GalleryElement] { get }
    var needReloadCollectionView: (() -> Void)? { get set }
     
    func getElementByIndexPath(_ indexPath: IndexPath) -> GalleryElement
    func goToDetails(selectedElementIndex: Int)
    func getGalleryElement()
    func tagLikedPhotos()
}
