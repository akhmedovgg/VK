//
//  AlphaViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class AlphaViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Настройки"
        
        view.backgroundColor = UIColor.cyan
        
        navigationItem.setRightBarButtonItems([
            UIBarButtonItem(image: UIImage(named: "28/copy_outline_28")!.resized(to: CGSize(width: 28, height: 28)), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: UIImage(named: "28/copy_outline_28")!.resized(to: CGSize(width: 28, height: 28)), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: UIImage(named: "28/copy_outline_28")!.resized(to: CGSize(width: 28, height: 28)), style: .plain, target: nil, action: nil)
        ], animated: true)
        
        let button = VKNavigationBarUserInfoButton(appearance: VKNavigationBarUserInfoButtonAppearancePrimary(),
                                                   profileImage: UIImage(named: "avatars/Pavel Durov")!,
                                                   fullName: "Pavel Durov",
                                                   networkStatus: "Online")
        navigationItem.titleView = button
        button.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
    }
    
    @objc func didTap(_ sender: UIControl) {
        print(#function)
    }
}
