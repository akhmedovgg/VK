//
//  VKMAuthViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 15/02/22.
//

import Foundation
import UIKit

class VKMAuthViewController: VKViewController<VKMAuthView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Подписки"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.pushViewController(AlphaViewController(), animated: true)
    }
}
