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
        label.textAlignment = .left
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
        likeButton.isSelected = viewModel.likeByUser
    }
    
    func layout() {
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 1.6)
        }
        
        imageDescription.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-14)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(64)
            make.bottom.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints { make in
            make.leading.equalTo(imageDescription.snp.trailing).inset(8)
            make.centerY.equalTo(imageDescription.snp.centerY)
            make.height.width.equalTo(64)
            make.trailing.equalToSuperview()
        }
    }
}
