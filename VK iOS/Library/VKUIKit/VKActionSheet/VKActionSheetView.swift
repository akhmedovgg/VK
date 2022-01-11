//
//  VKActionSheet.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetView: VKView {
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.clear
        view.layer.masksToBounds = true
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 14
        return view
    }()
    
    let cancelButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.black
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    let stackViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.black
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    let actionSheetTitleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.white
        return view
    }()
    
    let actionSheetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = VKPalette.steelGray500
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()
    
    let actionSheetTitleContainerViewBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.black.withAlphaComponent(0.12)
        return view
    }()
    
    override func setupAppearance() {
        backgroundColor = .clear
    }
    
    override func setupViewHierarchy() {
        addSubview(backgroundView)
        backgroundView.addSubview(contentView)
        contentView.addSubview(cancelButtonContainer)
        contentView.addSubview(stackViewContainer)
        stackViewContainer.addSubview(actionSheetTitleContainerView)
        actionSheetTitleContainerView.addSubview(actionSheetLabel)
        actionSheetTitleContainerView.addSubview(actionSheetTitleContainerViewBottomLine)
        stackViewContainer.addSubview(stackView)
    }
    
    override func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(contentView.snp.top)
        }
        
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(24)
            make.top.equalTo(actionSheetTitleContainerView.snp.top)
        }
        
        cancelButtonContainer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        stackViewContainer.snp.makeConstraints { make in
            make.top.equalTo(actionSheetTitleContainerView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(cancelButtonContainer.snp.top).inset(-8)
            make.height.greaterThanOrEqualTo(0)
        }
        
        actionSheetTitleContainerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(actionSheetLabel).inset(-15)
            make.leading.trailing.equalToSuperview()
        }
        
        actionSheetLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(0)
        }
        
        actionSheetTitleContainerViewBottomLine.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(actionSheetTitleContainerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    func setupActionButtons(actionButtons: [VKActionSheetButton], cancelButton: VKActionSheetButton) {
        cancelButtonContainer.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(56)
        }
        
        for actionButton in actionButtons {
            stackView.addArrangedSubview(actionButton)
            stackView.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(56)
            }
        }
    }
    
    func setTitle(_ title: String?) {
        actionSheetLabel.text = title
        
        if title == nil {
            actionSheetTitleContainerView.snp.remakeConstraints { make in
                make.height.equalTo(0)
            }
        } else {
            actionSheetTitleContainerView.snp.remakeConstraints { make in
                make.top.bottom.equalTo(actionSheetLabel).inset(-15)
                make.leading.trailing.equalToSuperview()
            }
        }
    }
}
