//
//  ImageGalleryViewController.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import UIKit

final class ImageGalleryViewController: UIViewController, ErrorPresentable {
    
    private var viewModel: ImageGalleryViewModeling
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
        
        _view.showLoader()
        viewModel.getGalleryElement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.tagLikedPhotos()
        _view.collectionView.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        _view.collectionView.reloadData()
    }
    
    /*
     */
    
    private func fillUI() {
        viewModel.needReloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?._view.collectionView.reloadData()
            }
        }
        
        viewModel.showError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(with: error, retryAction: { _ in
                    self?._view.showLoader()
                    self?.viewModel.getGalleryElement()
                })
            }
        }
        
        viewModel.hideLoader = { [weak self] in
            DispatchQueue.main.async {
                self?._view.hideLoader()
            }
        }
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
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ImageGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.galleryElements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageGalleryCell.identifier, for: indexPath) as? ImageGalleryCell
        let element = viewModel.getElementByIndexPath(indexPath)
        cell?.configureCell(with: element.urls.regular, isImageLiked: element.isLiked ?? false)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == viewModel.galleryElements.count - 3 {
            self.viewModel.getGalleryElement()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (_view.frame.width / 3) - 12, height: (_view.frame.width / 3) - 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToDetails(selectedElementIndex: indexPath.item)
    }
}
