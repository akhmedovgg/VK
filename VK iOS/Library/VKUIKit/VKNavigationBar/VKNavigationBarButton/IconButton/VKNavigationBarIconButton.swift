//
//  VKNavigationBarIconButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 04/02/22.
//

import Foundation
import UIKit

class VKNavigationBarIconButton: UIControl, VKNavigationBarButton {
    let appearance: VKNavigationBarIconButtonAppearance
    
    let iconImageView: UIImageView
    
    private let animationDuration = 0.1
    
    private(set) var animated = false
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear) { [weak self] in
                    guard let weakSelf = self, !weakSelf.animated else {
                        return
                    }
                    weakSelf.iconImageView.tintColor = weakSelf.appearance.highlightedIconColor
                    
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
                    weakSelf.iconImageView.tintColor = weakSelf.appearance.iconColor
                    
                } completion: { [weak self] _ in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    weakSelf.animated = false
                }
            }
        }
    }
    
    required init(frame: CGRect = .zero, appearance: VKNavigationBarIconButtonAppearance, icon: UIImage) {
        self.appearance = appearance
        
        self.iconImageView = {
            let imageView = UIImageView()
            imageView.image = icon
            imageView.tintColor = appearance.iconColor
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = false
            return imageView
        }()
        
        super.init(frame: frame)
        
        setupIconImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupIconImageView() {
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.center.equalToSuperview()
        }
    }
}
