//
//  VKMAuthView.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit

class VKMAuthView: VKView {
    
    let vkBrandLogotype: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "28/logo_vk_color_28")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loginButton: VKButton = {        
        let loginButton = VKButton(appearance: VKButtonAppearancePrimary(), size: VKButtonSizeLargeWithoutIcon())
        loginButton.titleLabel.text = "VKM_AUTH_SIGN_IN_USING_VK".localized()
        loginButton.titleLabel.textAlignment = .center
        return loginButton
    }()
    
    let changeLanguageButton: VKButton = {
        let loginButton = VKButton(appearance: VKButtonAppearanceSecondary(), size: VKButtonSizeLargeWithoutIcon())
        loginButton.titleLabel.text = "VKM_AUTH_CHANGE_LANGUAGE".localized()
        loginButton.titleLabel.textAlignment = .center
        return loginButton
    }()
    
    override func setupAppearance() {
        backgroundColor = VKPalette.white
    }
    
    override func setupViewHierarchy() {
        addSubview(vkBrandLogotype)
        addSubview(loginButton)
        addSubview(changeLanguageButton)
    }
    
    override func setupConstraints() {
        vkBrandLogotype.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(128)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(changeLanguageButton.snp.top).inset(-12)
        }
        
        changeLanguageButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(32)
        }
    }
    
    // MARK: - Mine
    
    func reloadTexts() {
        loginButton.titleLabel.text = "VKM_AUTH_SIGN_IN_USING_VK".localized()
        changeLanguageButton.titleLabel.text = "VKM_AUTH_CHANGE_LANGUAGE".localized()
    }
}
