//
//  ImageDetailsView.swift
//  Gallery
//
//  Created by Vladislav Simonov on 2.01.24.
//

import UIKit

final class ImageDetailsView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        return imageView
    }()
    
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
    
    private func setupViews() {
        addSubview(imageView)
    }
    
    func layout() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(UIScreen.main.bounds.height / 3)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
        }
    }
}
