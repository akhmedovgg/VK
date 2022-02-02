//
//  VKTabBarItem.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

protocol VKTabBarItem: VKViewController<VKView> {
    var vkTabBarTitle: String { get }
    var vkTabBarIcon: UIImage { get }
}
