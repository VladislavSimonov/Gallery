//
//  ImageCardViewModeling.swift
//  Gallery
//
//  Created by Vladislav Simonov on 5.01.24.
//

import Foundation

protocol ImageCardViewModeling: AnyObject {
    var id: String { get }
    var url: URL { get }
    var descriptionText: String { get }
}

