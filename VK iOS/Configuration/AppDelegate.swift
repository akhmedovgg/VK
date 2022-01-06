//
//  AppDelegate.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let storyboard = UIStoryboard(name: "Alpha", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController()
        let viewController = VKExperimentalViewController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = viewController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}
