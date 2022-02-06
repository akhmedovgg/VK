//
//  VKNavigationBarProfileButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 06/02/22.
//

import Foundation
import UIKit

class VKNavigationBarProfileButton: UIControl, VKNavigationBarButton {
    let appearance: VKNavigtionBarProfileButtonAppearance
    
    let profileImageImageView: UIImageView
    
    let fullNameImageView: UIImageView
    
    let networkStatusImageView: UIImageView
    
    private var animated = false
    
    private let animationDuration = 0.1
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear) { [weak self] in
                    guard let weakSelf = self, !weakSelf.animated else {
                        return
                    }
                    
                    if let alphaValue = weakSelf.appearance.highlightedImageAlpha {
                        weakSelf.profileImageImageView.alpha = alphaValue
                    }
                    
                    if let color = weakSelf.appearance.highlightedFullNameLabelColor {
                        weakSelf.fullNameImageView.tintColor = color
                    }
                    
                    if let color = weakSelf.appearance.highlightedNetworkStatusLabelColor {
                        weakSelf.networkStatusImageView.tintColor = color
                    }
                    
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
                    
                    weakSelf.profileImageImageView.alpha = 1
                    weakSelf.fullNameImageView.tintColor = weakSelf.appearance.fullNameLabelColor
                    weakSelf.networkStatusImageView.tintColor = weakSelf.appearance.networkStatusLabelColor
                    
                } completion: { [weak self] _ in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    weakSelf.animated = false
                }
            }
        }
    }
    
    init(frame: CGRect = .zero, appearance: VKNavigtionBarProfileButtonAppearance, profileImage: UIImage, fullName: String, networkStatus: String) {
        self.appearance = appearance
        self.profileImageImageView = UIImageView()
        self.fullNameImageView = UIImageView()
        self.networkStatusImageView = UIImageView()
        
        super.init(frame: .zero)
        
        setupUI()
        
        self.setProfileImage(profileImage)
        self.setFullName(fullName)
        self.setNetworkStatus(networkStatus)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(profileImageImageView)
        profileImageImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(36)
        }
        
        addSubview(fullNameImageView)
        fullNameImageView.snp.makeConstraints { make in
            make.top.equalTo(profileImageImageView.snp.top)
            make.leading.equalTo(profileImageImageView.snp.trailing).inset(-12)
            make.width.height.greaterThanOrEqualTo(0)
        }

        addSubview(networkStatusImageView)
        networkStatusImageView.snp.makeConstraints { make in
            make.top.equalTo(fullNameImageView.snp.bottom)
            make.leading.equalTo(fullNameImageView.snp.leading)
            make.width.height.greaterThanOrEqualTo(0)
        }
    }
    
    func setProfileImage(_ image: UIImage) {
        self.profileImageImageView.contentMode = .scaleAspectFill
        self.profileImageImageView.layer.cornerRadius = 18
        self.profileImageImageView.image = image
        self.profileImageImageView.clipsToBounds = true
    }
    
    func setFullName(_ fullName: String) {
        let vkLabel = VKLabel()
        vkLabel.text = fullName
        vkLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        self.fullNameImageView.image = vkLabel.makeScreenshot()
        self.fullNameImageView.tintColor = appearance.fullNameLabelColor
    }
    
    func setNetworkStatus(_ status: String) {
        let vkLabel = VKLabel()
        vkLabel.text = status
        vkLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        self.networkStatusImageView.image = vkLabel.makeScreenshot()
        self.networkStatusImageView.tintColor = appearance.networkStatusLabelColor
    }
}
