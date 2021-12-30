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
    let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.white
        view.layer.cornerRadius = 10
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
        
        //        let accept: VKButton = {
        //            let button = VKButton(appearance: VKButtonAppearanceTertiary(), size: VKButtonSizeMediumWithoutIcon())
        //            button.titleLabel.text = "Отмена"
        //            button.titleLabel.textAlignment = .center
        //            button.titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        ////            button.widthAnchor.constraint(equalToConstant: 136).isActive = true
        //            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        //            return button
        //        }()
        //
        //        let hr: UIView = {
        //            let view = UIView()
        //            view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        //            view.backgroundColor = VKPalette.black.withAlphaComponent(0.12)
        //            return view
        //        }()
        //
        //        let decline: VKButton = {
        //            let button = VKButton(appearance: VKButtonAppearanceTertiary(), size: VKButtonSizeMediumWithoutIcon())
        //            button.titleLabel.text = "Удалить"
        //            button.titleLabel.textAlignment = .center
        //            button.titleLabel.textColor = VKColor(hex: "#E64646FF")
        //            button.titleLabel.font = .systemFont(ofSize: 17, weight: .regular)
        ////            button.widthAnchor.constraint(equalToConstant: 136).isActive = true
        //            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        //            return button
        //        }()
        //
        //        buttonsStackView.addArrangedSubview(accept)
        //        buttonsStackView.addArrangedSubview(hr)
        //        buttonsStackView.addArrangedSubview(decline)
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
