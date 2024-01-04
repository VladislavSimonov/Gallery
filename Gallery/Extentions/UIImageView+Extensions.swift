//
//  UIImageView+Extensions.swift
//  Gallery
//
//  Created by Vladislav Simonov on 3.01.24.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(withURL url: URL?, placeholder: UIImage? = UIImage(named: "placeholderImage")) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
