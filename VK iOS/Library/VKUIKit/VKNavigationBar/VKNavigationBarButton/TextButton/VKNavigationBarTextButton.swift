//
//  VKNavigationBarTextButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 06/02/22.
//

import Foundation
import UIKit
import SnapKit

class VKNavigationBarTextButton: UIControl, VKNavigationBarButton {
    
    let appearance: VKNavigationBarTextButtonAppearance
    
    let titleImageView: UIImageView
    
    private let animationDuration = 0.1
    
    private(set) var animated = false
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear) { [weak self] in
                    guard let weakSelf = self, !weakSelf.animated else {
                        return
                    }
                    
                    weakSelf.titleImageView.tintColor = weakSelf.appearance.highlightedTitleColor
                    
                } completion: { [weak self] _ in
                    guard let weakSelf = self else {
                        return
                    }

                    weakSelf.animated = true
                }
            } else {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear) { [weak self] in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    weakSelf.titleImageView.tintColor = weakSelf.appearance.titleColor
                    
                    weakSelf.animated = false
                } completion: { [weak self] _ in
                    guard let weakSelf = self else {
                        return
                    }

                    weakSelf.animated = false
                }
            }
        }
    }
    
    required init(frame: CGRect = .zero, appearance: VKNavigationBarTextButtonAppearance, title: String) {
        self.appearance = appearance
        
        self.titleImageView = {
            let label = VKLabel()
            label.text = title
            label.font = UIFont(name: VKFonts.VKSansDisplayMedium.rawValue, size: 21)
            label.textAlignment = .center
            
            let imageView = UIImageView()
            imageView.image = label.makeScreenshot()
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = appearance.titleColor
            imageView.isUserInteractionEnabled = false
            return imageView
        }()
        
        super.init(frame: .zero)
        
        setupTitleImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleImageView() {
        addSubview(titleImageView)
        
        titleImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
