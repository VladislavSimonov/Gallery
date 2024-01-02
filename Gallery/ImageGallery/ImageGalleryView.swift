//
//  ImageGalleryView.swift
//  Gallery
//
//  Created by Vladislav Simonov on 29.12.23.
//

import UIKit
import SnapKit

final class ImageGalleryView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 8,
            bottom: 0,
            right: 8
        )
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.register(ImageGalleryCell.self,
                                forCellWithReuseIdentifier: ImageGalleryCell.identifier)
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     */
    
    private func setupViews() {
        addSubview(collectionView)
    }
    
    func layout() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
