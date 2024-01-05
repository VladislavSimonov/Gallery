//
//  ImageCardViewModeling.swift
//  Gallery
//
//  Created by Vladislav Simonov on 5.01.24.
//

import Foundation

protocol ImageCardViewModeling: AnyObject {
    var url: URL { get }
    var descriptionText: String { get }
    var likeByUser: Bool { get }
}

