//
//  ImageDetailsViewController.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

final class ImageDetailsViewController: UIViewController {
    
    var viewModel: ImageDetailsViewModeling!
    private let _view = ImageDetailsView()
    
    init(viewModel: ImageDetailsViewModeling) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewCallbacks()
        
        fillUI()
        layout()
    }
    
    /*
     */
    
    private func fillUI() {
        
    }
    
    private func layout() {
        _view.layout()
    }
    
    private func setupView() {
        
    }
    
    private func setupViewCallbacks() {
        
    }
}
