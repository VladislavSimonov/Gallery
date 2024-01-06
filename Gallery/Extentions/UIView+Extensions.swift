//
//  UIView+Extensions.swift
//  Gallery
//
//  Created by Vladislav Simonov on 6.01.24.
//

import UIKit

protocol Loadable {
    func showLoader()
    func hideLoader()
}

extension UIView: Loadable { 
    func showLoader() {
        if let activityIndicator = findActivity() {
            activityIndicator.startAnimating()
        } else {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.startAnimating()
            addSubview(activityIndicator)
            
            activityIndicator.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
        }
    }
    
    func hideLoader() {
        findActivity()?.stopAnimating()
    }
    
    private func findActivity() -> UIActivityIndicatorView? {
        subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
}
