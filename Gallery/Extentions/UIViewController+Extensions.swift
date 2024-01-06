//
//  UIViewController+Extensions.swift
//  Gallery
//
//  Created by Vladislav Simonov on 6.01.24.
//

import UIKit

extension UIViewController {
    func showAlert(with errorText: String, retryAction: @escaping ((UIAlertAction) -> Void)) {
        let alertVC = UIAlertController(title: "Error",
                                        message: errorText,
                                        preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK",
                                        style: .default)
        let retryAction = UIAlertAction(title: "Retry",
                                        style: .default,
                                        handler: retryAction)
        alertVC.addAction(alertAction)
        alertVC.addAction(retryAction)
        self.present(alertVC, animated: true)
    }
}
