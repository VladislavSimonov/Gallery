//
//  ErrorPresentable.swift
//  Gallery
//
//  Created by Vladislav Simonov on 6.01.24.
//

import UIKit

protocol ErrorPresentable {
    func showAlert(with error: NetworkingError, retryAction: @escaping ((UIAlertAction) -> Void))
}

extension ErrorPresentable where Self: UIViewController {
    func showAlert(with error: NetworkingError, retryAction: @escaping ((UIAlertAction) -> Void)) {
        let alertVC = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        let retryAction = UIAlertAction(title: "Retry", style: .default, handler: retryAction)
        alertVC.addAction(alertAction)
        alertVC.addAction(retryAction)
        self.present(alertVC, animated: true)
    }
}
