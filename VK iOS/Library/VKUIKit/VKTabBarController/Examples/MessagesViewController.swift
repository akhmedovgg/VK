//
//  MessagesViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

class MessagesViewController: VKViewController<VKView>, VKTabBarItem {
    
    var vkTabBarTitle: String = "Messages"
    
    var vkTabBarIcon: UIImage = {
        let image = UIImage(named: "20/message_outline_20")!.withRenderingMode(.alwaysTemplate)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red = CGFloat.random(in: 0...255) / 255
        let green = CGFloat.random(in: 0...255) / 255
        let blue = CGFloat.random(in: 0...255) / 255
        
        print(red, green, blue)
        
        view.backgroundColor = UIColor(red: red,
                                       green: green,
                                       blue: blue,
                                       alpha: 1)
    }
}
