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
    var coordinator: VKCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let storyboard = UIStoryboard(name: "Alpha", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController()
        
//        coordinator = VKMAuthCoordinator(navigationController: UINavigationController())
//        coordinator.start()
        //        let viewController = coordinator.navigationController

//        VK.setUp(appId: VKCredentials.sharedInstance.appID, delegate: self)
        
        let controller = VKTabBarController(appearance: VKTabBarAppearancePrimary())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = controller
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

// MARK: - SwiftyVKDelegate

typealias SwiftyVKViewController = SwiftyVK.VKViewController

extension AppDelegate: SwiftyVKDelegate {
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return [
            .notify,
            .friends,
            .photos,
            .audio,
            .video,
            .docs,
            .notes,
            .pages,
            .status,
            .offers,
            .questions,
            .wall,
            .groups,
//            .messages,
            .email,
            .notifications,
            .stats,
            .ads,
            .offline,
            .market
        ]
    }
    
    func vkNeedToPresent(viewController: SwiftyVKViewController) {
        coordinator.navigationController.viewControllers.last!.present(viewController, animated: true, completion: nil)
    }
}
