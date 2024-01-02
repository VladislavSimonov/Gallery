//
//  BaseCollectionViewCell.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
