//
//  VKTabBarItemControl.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

class VKTabBarItemControl: UIControl {
    
    let vkTabBarItem: VKTabBarItem
    
    let iconImageView: UIImageView
    
    let textImageView: UIImageView
    
    let appearance: VKTabBarAppearance
    
    var animated = false
    
    var isPresented: Bool = false {
        didSet {
            let iconColor = isPresented ? appearance.selectedIconColor : appearance.iconColor
            let textColor = isPresented ? appearance.selectedTextColor : appearance.textColor
            
            iconImageView.tintColor = iconColor
            textImageView.tintColor = textColor
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                guard animated == false else {
                    return
                }
                
                UIView.animate(withDuration: 0.072, delay: 0, options: .transitionCrossDissolve) { [weak self] in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    if let color = weakSelf.appearance.highlightedIconColor {
                        weakSelf.iconImageView.tintColor = color
                    }
                    
                    if let color = weakSelf.appearance.highlightedTextColor {
                        weakSelf.textImageView.tintColor = color
                    }
                    
                    weakSelf.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
                    
                    weakSelf.animated = true
                }
            } else {
                guard animated == true else {
                    return
                }
                
                UIView.animate(withDuration: 0.072, delay: 0, options: .transitionCrossDissolve) { [weak self] in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    let iconColor = weakSelf.isPresented ? weakSelf.appearance.selectedIconColor : weakSelf.appearance.iconColor
                    let textColor = weakSelf.isPresented ? weakSelf.appearance.selectedTextColor : weakSelf.appearance.textColor
                    
                    weakSelf.iconImageView.tintColor = iconColor
                    weakSelf.textImageView.tintColor = textColor
                    
                    weakSelf.transform = CGAffineTransform(scaleX: 1, y: 1)
                    
                    weakSelf.animated = false
                } completion: { [weak self] _ in
                    self!.isPresented = self!.isPresented
                }
            }
        }
    }
    
    required init(vkTabBarItem: VKTabBarItem, appearance: VKTabBarAppearance, frame: CGRect = .zero) {
        self.vkTabBarItem = vkTabBarItem
        self.appearance = appearance
        
        self.iconImageView = {
            let imageView = UIImageView()
            imageView.tintColor = VKPalette.gray300
            imageView.contentMode = .scaleAspectFit
            imageView.image = vkTabBarItem.vkTabBarIcon
            return imageView
        }()
        
        self.textImageView = {
            let label = VKLabel()
            label.text = vkTabBarItem.vkTabBarTitle
            label.font = .systemFont(ofSize: 10, weight: .medium)
            
            let imageView = UIImageView()
            imageView.image = label.makeScreenshot()
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = VKPalette.gray300
            return imageView
        }()
        
        super.init(frame: frame)
        
        configureCommon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCommon() {
        setupAppearance()
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupAppearance() {
    }
    
    private func setupViewHierarchy() {
        addSubview(iconImageView)
        addSubview(textImageView)
    }
    
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(28)
        }
        
        textImageView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).inset(-2)
            make.centerX.equalToSuperview()
        }
    }
}
