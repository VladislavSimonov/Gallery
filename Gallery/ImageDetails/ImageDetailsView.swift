//
//  ImageDetailsView.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

final class ImageDetailsView: UIView {
    
    lazy var imageDetailsScrollView: ImageCardScrollView = {
        let cardScrollView = ImageCardScrollView()
        return cardScrollView
    }()
    
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .darkGray
//        return imageView
//    }()
//    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .green
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     */
    
    func setupCards(_ cards: [ImageCardView], currentPage: Int) {
        imageDetailsScrollView.setupCards(cards, currentPage: currentPage)
        
        imageDetailsScrollView.cards.forEach { ($0 as? ImageCardView)?.layout() }
    }
    
    private func setupViews() {
        addSubview(imageDetailsScrollView)
    }
    
    func layout() {
        imageDetailsScrollView.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
