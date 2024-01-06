//
//  ImageCardView.swift
//  Gallery
//
//  Created by Vladislav Simonov on 4.01.24.
//

import UIKit

final class ImageCardView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var imageDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .red
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        return button
    }()
    
    @objc func buttonDidTap() {
        viewModel.likeButtonDidTouch?()
        likeButton.isSelected.toggle()
    }
    
    private var viewModel: ImageCardViewModeling
    
    init(viewModel: ImageCardViewModeling) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        /*
         */
        
        clipsToBounds = true
        
        /*
         */
        
        setupViews()
        fillUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     */
    
    private func setupViews() {
        addSubview(imageView)
        addSubview(imageDescription)
        addSubview(likeButton)
    }
    
    private func fillUI() {
        imageView.setImage(withURL: viewModel.url)
        imageDescription.text = viewModel.descriptionText
        likeButton.isSelected = viewModel.isPhotoLiked
    }
    
    func layout() {
        imageView.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(UIDevice.current.orientation != .portrait ? 300: 0)
            make.height.equalTo(UIScreen.main.bounds.height / 1.6)
        }
        
        imageDescription.snp.remakeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-14)
            make.leading.equalToSuperview().inset(UIDevice.current.orientation != .portrait ? 300: 16)
            make.trailing.equalToSuperview().inset(UIDevice.current.orientation != .portrait ? 300: 64)
            if UIDevice.current.orientation != .portrait {
                make.height.equalTo(60)
            } else {
                make.bottom.equalToSuperview()
            }
        }
        
        likeButton.snp.remakeConstraints { make in
            if imageDescription.text?.isEmpty == true {
                make.top.equalTo(imageView.snp.bottom).inset(-24)
                make.centerX.equalTo(imageView.snp.centerX)
            } else {
                make.leading.equalTo(imageDescription.snp.trailing).inset(-16)
                make.centerY.equalTo(imageDescription.snp.centerY)
            }
            make.height.width.equalTo(40)
        }
    }
}
