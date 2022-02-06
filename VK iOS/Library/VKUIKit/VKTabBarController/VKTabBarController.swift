//
//  VKTabBarController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

class VKTabBarController: VKViewController<VKTabBarView> {
    
    let appearance: VKTabBarAppearance
    
    var activeTabBarControl: VKTabBarItemControl?
    
    required init(appearance: VKTabBarAppearance, nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        self.appearance = appearance
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewController(HomeViewController())
        setViewController(HubViewController())
        setViewController(MessagesViewController())
        setViewController(ClipsViewController())
        setViewController(FriendsViewController())
    }
    
    @available(iOS 11, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        rootView.setupSafeAreaInsets()
    }
    
    func setViewController(_ vkTabBarItem: VKTabBarItem) {
        let itemControl = VKTabBarItemControl(vkTabBarItem: vkTabBarItem, appearance: appearance)
        
        if activeTabBarControl == nil {
            itemControl.isPresented = true
            rootView.setContentView(itemControl.vkTabBarItem.view)
            activeTabBarControl = itemControl
        }
        
        itemControl.addTarget(self, action: #selector(didTapItem(_:)), for: .touchUpInside)
        rootView.stackView.addArrangedSubview(itemControl)
    }
    
    @objc func didTapItem(_ sender: VKTabBarItemControl) {
        if let activeTabBarControl = activeTabBarControl {
            activeTabBarControl.isPresented = false
        }
        
        activeTabBarControl = sender
        activeTabBarControl!.isPresented = true
        rootView.setContentView(activeTabBarControl!.vkTabBarItem.view)
    }
}
