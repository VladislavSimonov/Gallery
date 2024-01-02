//
//  ImageGalleryViewController.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import UIKit

final class ImageGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModel: ImageGalleryViewModeling!
    private let _view = ImageGalleryView()
    
    init(viewModel: ImageGalleryViewModeling) {
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
        _view.collectionView.delegate = self
        _view.collectionView.dataSource = self
    }
    
    private func setupViewCallbacks() {
        
    }
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: ImageGalleryCell.identifier, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (_view.frame.width / 3) - 12, height: (_view.frame.width / 3) - 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToDetails()
    }
}
