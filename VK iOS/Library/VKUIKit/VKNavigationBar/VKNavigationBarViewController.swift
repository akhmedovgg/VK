//
//  VKNavigationBarViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 04/02/22.
//

import Foundation
import UIKit

class VKNavigationBarViewController: VKViewController<VKNavigationBarView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setLeftSideNavigationBarButtons(_ buttons: [VKNavigationBarButton]) {
        rootView.setLeftSideNavigationBarButtons(buttons)
    }
    
    func setCenterButton(_ button: VKNavigationBarButton) {
        rootView.setCenterNavigationBarButton(button)
    }
    
    func setRightSideNavigationBarButtons(_ buttons: [VKNavigationBarButton]) {
        rootView.setRightSideNavigationBarButtons(buttons)
    }
}
