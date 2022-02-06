//
//  VKNavigationBarView.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 04/02/22.
//

import Foundation
import UIKit

class VKNavigationBarView: VKView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let leftSideStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let rightSideStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override func setupAppearance() {
        backgroundColor = VKPalette.white
    }
    
    override func setupViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(leftSideStackView)
        containerView.addSubview(centerView)
        containerView.addSubview(rightSideStackView)
    }
    
    override func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(52)
        }
        
        leftSideStackView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalTo(0)
        }
        
        centerView.snp.makeConstraints { make in
            make.leading.equalTo(leftSideStackView.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(rightSideStackView.snp.leading)
        }
        
        rightSideStackView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalTo(0)
        }
    }
    
    func setLeftSideNavigationBarButtons(_ buttons: [UIControl]) {
        for subview in leftSideStackView.subviews {
            subview.removeFromSuperview()
        }

        guard !buttons.isEmpty else {
            leftSideStackView.snp.remakeConstraints { make in
                make.leading.top.bottom.equalToSuperview()
                make.width.equalTo(0)
            }
            return
        }

        for button in buttons {
            leftSideStackView.addArrangedSubview(button)

            button.snp.makeConstraints { make in
                make.width.equalTo(44)
            }
        }
        
        leftSideStackView.snp.remakeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.trailing.equalTo(leftSideStackView.arrangedSubviews.last!.snp.trailing)
        }
    }
    
    func setCenterNavigationBarButton(_ view: UIControl?) {
        guard let view = view else {
            for subview in centerView.subviews {
                subview.removeFromSuperview()
            }
            return
        }
        
        centerView.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setRightSideNavigationBarButtons(_ buttons: [UIControl]) {
        for subview in rightSideStackView.subviews {
            subview.removeFromSuperview()
        }

        guard !buttons.isEmpty else {
            rightSideStackView.snp.remakeConstraints { make in
                make.top.bottom.trailing.equalToSuperview()
                make.width.equalTo(0)
            }
            return
        }

        for button in buttons {
            rightSideStackView.addArrangedSubview(button)

            button.snp.makeConstraints { make in
                make.width.equalTo(44)
            }
        }
        
        rightSideStackView.snp.remakeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(rightSideStackView.arrangedSubviews.first!.snp.leading)
        }
    }
}
