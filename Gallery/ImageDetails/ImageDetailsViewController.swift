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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        _view.imageDetailsScrollView.recalculateFrame()
        _view.setupCards(viewModel.createImageCards(),
                         currentPage: viewModel.currentElementIndex)
    }
    
    /*
     */
    
    private func fillUI() {
        _view.setupCards(viewModel.createImageCards(), 
                         currentPage: viewModel.currentElementIndex)
    }
    
    private func layout() {
        _view.layout()
    }
    
    private func setupView() {
        
    }
    
    private func setupViewCallbacks() {
        _view.imageDetailsScrollView.didScrolledToIndex = { [weak self] index in
            self?.viewModel.didScrolled(to: index)
        }
    }
}
