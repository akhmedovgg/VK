//
//  VKActionSheetContainer.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetContainerView: VKView {
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = VKPalette.black
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.layer.cornerRadius = 14
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    let cancelButton: UIControl = {
        let button = VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearancePrimary())
        button.titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        button.layer.cornerRadius = 14
        return button
    }()
    
    override func setupAppearance() {
//        backgroundColor = .blue
    }
    
    override func setupViewHierarchy() {
        addSubview(cancelButton)
        addSubview(buttonsStackView)
    }
    
    override func setupConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.bottom.equalTo(cancelButton.snp.top).inset(-8)
            make.leading.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        snp.makeConstraints { make in
            make.top.equalTo(buttonsStackView.snp.top)
            make.bottom.equalTo(cancelButton.snp.bottom)
        }
        
        configureButtons()
    }
    
//    func configureButtons(actionsButton: [VKActionSheetButton], cancelButton: VKActionSheetButton) {
//
//    }
    
    func configureButtons() {
        for num in 1...5 {
            let appearance = VKActionSheetTextButtonAppearancePrimary()
            appearance.hasBottomLine = num != 5
            
            let btn1 = VKActionSheetTextButton(appearance: appearance)
            btn1.titleLabel.text = "Action \(num)"
            btn1.addTarget(self, action: #selector(testFunc), for: .touchUpInside)
            
            buttonsStackView.addArrangedSubview(btn1)
        }
    }
    
    @objc func testFunc() {
        print(#function)
    }
}
