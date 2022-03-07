//
//  AppDelegate.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/12/21.
//

import UIKit
import SwiftyVK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Bundle.swizzleLocalization()
        
        let controller = UINavigationController(navigationBarClass: VKUINavigationBar.self, toolbarClass: nil)
        controller.setViewControllers([VKMAuthViewController()], animated: false)
//        let controller = UINavigationController(rootViewController: VKMAuthViewController())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = controller
        self.window!.makeKeyAndVisible()
        
        return true
    }
}
