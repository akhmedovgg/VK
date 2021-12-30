//
//  VKViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 31/12/21.
//

import Foundation
import UIKit

class VKViewController<RootView: UIView>: UIViewController, VKRootViewProtocol {
//    var rootViewLoaded: RootView? {
//        if self.isViewLoaded {
//            self.rootView
//        }
//        return nil
//    }
    
    override func viewDidLoad() {
        self.view = RootView(frame: UIScreen.main.bounds)
    }
}
