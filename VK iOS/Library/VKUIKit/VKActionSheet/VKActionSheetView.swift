//
//  VKActionSheet.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation

class VKActionSheetView: VKView {
    override func setupAppearance() {
        backgroundColor = VKColor.black.withAlphaComponent(0.4)
    }
    
    override func setupViewHierarchy() {}
    
    override func setupConstraints() {}
    
    func configure(with container: VKActionSheetContainerView) {
        addSubview(container)
        container.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(24)
            make.height.greaterThanOrEqualTo(0)
        }
    }
}
