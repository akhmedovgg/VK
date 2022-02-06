//
//  ClipsViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

class ClipsViewController: VKViewController<VKView>, VKTabBarItem {
    
    var vkTabBarTitle: String = "Clips"
    
    var vkTabBarIcon: UIImage = {
        let image = UIImage(named: "24/clip_outline_24")!.withRenderingMode(.alwaysTemplate)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red = CGFloat.random(in: 0...255) / 255
        let green = CGFloat.random(in: 0...255) / 255
        let blue = CGFloat.random(in: 0...255) / 255
        
        view.backgroundColor = UIColor(red: red,
                                       green: green,
                                       blue: blue,
                                       alpha: 1)
    }
}
