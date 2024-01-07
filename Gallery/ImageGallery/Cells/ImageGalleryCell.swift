//
//  ImageGalleryCell.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

final class ImageGalleryCell: BaseCollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        layout()
    }
    
    func configureCell(with URLstring: String, isImageLiked: Bool) {
        let url = URL(string: URLstring)
        imageView.setImage(withURL: url)
        likeImage.isHidden = !isImageLiked
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(likeImage)
    }
    
    private func layout() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        likeImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(3)
            make.bottom.equalToSuperview().inset(3)
        }
    }
}
