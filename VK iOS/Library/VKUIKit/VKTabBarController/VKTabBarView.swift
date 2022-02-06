//
//  VKTabBarView.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

class VKTabBarView: VKView {
    
    let tabBarContainer: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.white
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = VKPalette.black
        return view
    }()
    
    override func setupAppearance() {
        backgroundColor = .cyan
    }
    
    override func setupViewHierarchy() {
        addSubview(tabBarContainer)
        tabBarContainer.addSubview(stackView)
        addSubview(contentView)
    }
    
    override func setupConstraints() {
        tabBarContainer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(49)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(tabBarContainer.snp.top)
        }
    }
    
    func setupSafeAreaInsets() {
        
        tabBarContainer.snp.updateConstraints { make in
            var height: CGFloat = 49
            if #available(iOS 11, *) {
                height += safeAreaInsets.bottom
            }
            
            make.height.equalTo(height)
        }
    }
    
    func setContentView(_ view: UIView) {
        for subView in contentView.subviews {
            subView.removeFromSuperview()
        }
        
        contentView.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}
