//
//  VKNavigationBarUserInfoButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 08/02/22.
//

import Foundation
import UIKit

final class VKNavigationBarUserInfoButton: UIControl {
    var appearance: VKNavigationBarUserInfoButtonAppearance
    
    private let profileImageView: UIImageView
    var profileImage: UIImage? {
        get {
            return profileImageView.image
        }
        set {
            profileImageView.image = newValue
        }
    }
    
    private let fullNameImageView: UIImageView
    var fullName: String = "" {
        didSet {
            self.setFullName(fullName)
        }
    }
    
    private let networkStatusImageView: UIImageView
    var networkStatus: String = "" {
        didSet {
            self.setNetworkStatus(networkStatus)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    private var isHighlightAnimationRunning = false
    override var isHighlighted: Bool {
        didSet {
            guard let animationDuration = appearance.animationDuration else {
                return
            }
            
            if isHighlighted, !isHighlightAnimationRunning {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseInOut) { [weak self] in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    if let alphaValue = weakSelf.appearance.highlightedProfileImageAplhaValue {
                        weakSelf.profileImageView.alpha = alphaValue
                    }
                    
                    if let color = weakSelf.appearance.highlightedFullNameColor {
                        weakSelf.fullNameImageView.tintColor = color
                    }
                    
                    if let color = weakSelf.appearance.highlightedNetworkStatusColor {
                        weakSelf.networkStatusImageView.tintColor = color
                    }
                } completion: { [weak self] _ in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    weakSelf.isHighlightAnimationRunning = true
                }
            }
            
            if !isHighlighted {
                UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseInOut) { [weak self] in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    weakSelf.profileImageView.alpha = 1
                    weakSelf.fullNameImageView.tintColor = weakSelf.appearance.fullNameColor
                    weakSelf.networkStatusImageView.tintColor = weakSelf.appearance.networkStatusColor
                } completion: { [weak self] _ in
                    guard let weakSelf = self else {
                        return
                    }
                    
                    weakSelf.isHighlightAnimationRunning = false
                }
            }
        }
    }
    
    required init(appearance: VKNavigationBarUserInfoButtonAppearance, profileImage: UIImage, fullName: String, networkStatus: String, frame: CGRect = .zero) {
        self.appearance = appearance
        self.profileImageView = UIImageView()
        self.fullNameImageView = UIImageView()
        self.networkStatusImageView = UIImageView()
        
        super.init(frame: frame)
        
        setupUI()
        
        self.profileImage = profileImage
        self.setFullName(fullName)
        self.setNetworkStatus(networkStatus)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        setupProfileImageView()
        setupFullNameImageView()
        setupNetworkStatus()
    }
    
    private func setupProfileImageView() {
        profileImageView.layer.cornerRadius = 18
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.isUserInteractionEnabled = false
        profileImageView.frame = CGRect(x: 0, y: (44 - 36) / 2, width: 36, height: 36)
        
        addSubview(profileImageView)
    }
    
    private func setupFullNameImageView() {
        fullNameImageView.tintColor = VKPalette.black
        fullNameImageView.contentMode = .scaleAspectFit
        fullNameImageView.frame = CGRect(x: profileImageView.frame.width + 12,
                                         y: profileImageView.frame.origin.y,
                                         width: 0,
                                         height: 0)
        addSubview(fullNameImageView)
    }
    
    private func setupNetworkStatus() {
        networkStatusImageView.tintColor = VKPalette.steelGray400
        networkStatusImageView.contentMode = .scaleAspectFit
        networkStatusImageView.frame = CGRect(x: profileImageView.frame.width + 12,
                                              y: profileImageView.frame.origin.y + 21,
                                              width: 0,
                                              height: 0)
        addSubview(networkStatusImageView)
    }
    
    private func setFullName(_ fullName: String) {
        let label = UILabel()
        label.text = fullName
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        let image = label.makeScreenshot()
        
        self.fullNameImageView.image = image
        self.fullNameImageView.sizeToFit()
    }
    
    private func setNetworkStatus(_ networkStatus: String) {
        let label = UILabel()
        label.text = networkStatus
        label.font = .systemFont(ofSize: 13, weight: .regular)
        
        let image = label.makeScreenshot()
        
        self.networkStatusImageView.image = image
        self.networkStatusImageView.sizeToFit()
    }
}
