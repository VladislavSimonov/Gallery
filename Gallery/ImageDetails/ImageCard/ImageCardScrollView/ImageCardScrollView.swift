//
//  ImageCardScrollView.swift
//  Gallery
//
//  Created by Vladislav Simonov on 4.01.24.
//

import Foundation
import UIKit

final class ImageCardScrollView: UIView, UIScrollViewDelegate {
    
    struct Constants {
        static let spaceBetweenElements: CGFloat = 12
        static let halfSpaceBetweenElements: CGFloat = spaceBetweenElements / 2.0
    }
    
    var cards: [UIView] = []
    var didScrolledToIndex: ((Int)->Void)?
    
    private var scrollViewSize: CGSize {
        CGSize(width: frame.width - Constants.spaceBetweenElements * 3,
               height: frame.height)
    }
    
    private var pageSize: CGSize {
        CGSize(width: scrollViewSize.width - Constants.spaceBetweenElements,
               height: scrollViewSize.height)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.clipsToBounds = false
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    var currentPage: Int = 0
    
    /*
     */
    
    init(size: CGSize? = nil) {
        let screenWidth = UIScreen.main.bounds.width
        let defaultSize = CGSize(width: 375, height: UIScreen.main.bounds.height / 1.3)
        let calculatedHeight = defaultSize.height * screenWidth / defaultSize.width
        let cardSize = CGSize(width: screenWidth, height: calculatedHeight)
        
        super.init(frame: CGRect(origin: .zero,
                                 size: size ?? cardSize))
        
        backgroundColor = .white
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     */
    
    func recalculateFrame() {
        let screenWidth = UIScreen.main.bounds.width
        let defaultSize = CGSize(width: 375, height: UIScreen.main.bounds.height / 1.3)
        let calculatedHeight = defaultSize.height * screenWidth / defaultSize.width
        let cardSize = CGSize(width: screenWidth, height: calculatedHeight)
        
        frame = CGRect(origin: .zero,
                       size: cardSize)
    }
    
    private func setupViews() {
        addSubview(scrollView)
    }
    
    private func layout() {
        scrollView.snp.remakeConstraints { make in
            make.size.equalTo(scrollViewSize)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
    }
    
    private func addPages() {
        for page in cards {
            
            var x: CGFloat = Constants.halfSpaceBetweenElements
            
            if let lastAddedPage = scrollView.subviews.last {
                if scrollView.subviews.count >= 1 {
                    x += lastAddedPage.frame.maxX + Constants.halfSpaceBetweenElements
                } else {
                    x += lastAddedPage.frame.maxX
                }
            }
            
            page.frame = CGRect(
                x: x,
                y: 0,
                width: pageSize.width,
                height: pageSize.height
            )
            
            scrollView.addSubview(page)
        }
        
        if let lastAddedPage = scrollView.subviews.last {
            scrollView.contentSize = CGSize(
                width: lastAddedPage.frame.maxX + Constants.halfSpaceBetweenElements,
                height: scrollViewSize.height
            )
            
            if let firstX = scrollView.subviews.first?.frame.maxX {
                scrollView.setContentOffset(CGPoint(x:  (firstX + (Constants.halfSpaceBetweenElements)) * CGFloat(currentPage), y: 0), animated: false)
            }
        }
    }
    
    private func removePreviousCardsIfNeeded() {
        guard !cards.isEmpty else { return }
        
        for subview in scrollView.subviews {
            subview.removeFromSuperview()
        }
        
        scrollView.setContentOffset(.zero, animated: false)
        
        scrollView.removeFromSuperview()
        scrollView.contentSize = .zero
        
        cards = []
    }
    
    func setupCards(_ cards: [UIView], currentPage: Int) {
        removePreviousCardsIfNeeded()
        
        self.cards = cards
        self.currentPage = currentPage
        
        setupViews()
        layout()
        
        addPages()
        
        scrollView.isScrollEnabled = cards.count >= 2 ? true : false
    }
    
    /*
     MARK: - UIScrollViewDelegate
     */
    
    var decelerating = false
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard decelerating else { return }
        decelerating = false
        
        didScrolledToIndex?(Int(round(scrollView.contentOffset.x / scrollView.frame.width)))
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        decelerating = decelerate
    }
}
