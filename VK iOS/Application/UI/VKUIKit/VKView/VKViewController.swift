//
//  VKViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

class VKViewController<RootView: UIView>: UIViewController, VKRootViewProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem()
        self.view = RootView(frame: UIScreen.main.bounds)
    }
}
