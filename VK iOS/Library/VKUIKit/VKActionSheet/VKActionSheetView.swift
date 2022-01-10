//
//  VKActionSheet.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetView: VKView {
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.clear
        view.layer.masksToBounds = true
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
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.layer.cornerRadius = 14
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    override func setupAppearance() {
        backgroundColor = .clear
    }
    
    override func setupViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(cancelButtonContainer)
        contentView.addSubview(stackViewContainer)
        stackViewContainer.addSubview(stackView)
    }
    
    override func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(stackViewContainer.snp.top)
        }
        
        cancelButtonContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(24)
            make.height.greaterThanOrEqualTo(0)
        }
        
        stackViewContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(cancelButtonContainer.snp.top).inset(-8)
            make.height.greaterThanOrEqualTo(0)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
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
}
