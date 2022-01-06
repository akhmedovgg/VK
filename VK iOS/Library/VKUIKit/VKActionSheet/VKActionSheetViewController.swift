//
//  VKActionSheet.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation

class VKActionSheetViewController: VKViewController<VKActionSheetView> {
    
    let containerViewController: VKActionSheetContainerViewController
    
    required init(actionButtons: [VKActionSheetButton], cancelButton: VKActionSheetButton) {
        self.containerViewController = VKActionSheetContainerViewController(actionButtons: actionButtons, cancelButton: cancelButton)
        super.init(nibName: nil, bundle: nil)
        configureController()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.configure(with: containerViewController.rootView)
    }
    
    private func configureController() {
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
}
