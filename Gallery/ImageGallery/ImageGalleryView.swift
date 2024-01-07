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
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.register(ImageGalleryCell.self,
                                forCellWithReuseIdentifier: ImageGalleryCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
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
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.top.bottom.equalToSuperview()
        }
    }
}
