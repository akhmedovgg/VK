//
//  VKActionSheetContainerController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation

class VKActionSheetContainerViewController: VKViewController<VKActionSheetContainerView> {
    let actionButtons: [VKActionSheetButton]
    let cancelButton: VKActionSheetButton
    
    required init(actionButtons: [VKActionSheetButton], cancelButton: VKActionSheetButton) {
        self.actionButtons = actionButtons
        self.cancelButton = cancelButton
        super.init(nibName: nil, bundle: nil)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureView() {
        
    }
}
