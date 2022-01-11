//
//  VKAlertView.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 31/12/21.
//

import Foundation
import UIKit
import SnapKit

class VKAlertView: VKView {
    private(set) var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = VKPalette.black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = VKPalette.black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.black.withAlphaComponent(0.12)
        return view
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    override func setupAppearance() {
    }
    
    override func setupViewHierarchy() {
        addSubview(blurView)
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(horizontalLine)
        containerView.addSubview(buttonsStackView)
    }
    
    override func setupConstraints() {
        blurView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(51)
            make.trailing.equalToSuperview().inset(52)
            make.bottom.equalTo(buttonsStackView.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(0)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-19)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalLine.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
    }
}
