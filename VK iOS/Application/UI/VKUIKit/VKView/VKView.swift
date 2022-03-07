//
//  VKView.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

class VKView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        setupAppearance()
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupAppearance() {}
    
    func setupViewHierarchy() {}
    
    func setupConstraints() {}
}
