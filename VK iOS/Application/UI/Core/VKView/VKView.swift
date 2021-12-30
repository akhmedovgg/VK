//
//  VKView.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 31/12/21.
//

import Foundation
import UIKit

class VKView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.setupAppearance()
        self.setupViewHierarchy()
        self.setupConstraints()
    }
    
    func setupAppearance() {}
    
    func setupViewHierarchy() {}
    
    func setupConstraints() {}
}
