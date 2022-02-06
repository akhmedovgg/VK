//
//  MessagesViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 02/02/22.
//

import Foundation
import UIKit

class MessagesViewController: VKViewController<VKView>, VKTabBarItem {
    
    var vkTabBarTitle: String = "Messenger"
    
    var vkTabBarIcon: UIImage = {
        let image = UIImage(named: "20/message_outline_20")!.withRenderingMode(.alwaysTemplate)
        return image
    }()
    
    let vkNavigationBarController: VKNavigationBarViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.vkNavigationBarController = VKNavigationBarViewController()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftButton = VKNavigationBarIconButton(
            appearance: VKNavigationBarIconButtonAppearancePrimary(),
            icon: UIImage(named: "28/chevron_back_28")!.withRenderingMode(.alwaysTemplate)
        )
        self.vkNavigationBarController.setLeftSideNavigationBarButtons([leftButton])
        
        let centerButton = VKNavigationBarProfileButton(
            appearance: VKNavigtionBarProfileButtonAppearancePrimary(),
            profileImage: UIImage(named: "avatars/Taylor Swift")!,
            fullName: "Taylor Swift",
            networkStatus: "online"
        )
        self.vkNavigationBarController.setCenterButton(centerButton)
        
        let rightButton = VKNavigationBarIconButton(
            appearance: VKNavigationBarIconButtonAppearancePrimary(),
            icon: UIImage(named: "28/phone_outline_28")!.withRenderingMode(.alwaysTemplate)
        )
        self.vkNavigationBarController.setRightSideNavigationBarButtons([rightButton])
        
        // -==-==--=-=-=
        
        view.backgroundColor = VKColor(hex: "#4C75A3FF")
        
        setupNavigationBar()
    }
    
    @available(iOS 11, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        vkNavigationBarController.rootView.snp.updateConstraints { make in
            make.height.equalTo(52 + view.safeAreaInsets.top)
        }
        
    }
    
    private func setupNavigationBar() {
        rootView.addSubview(vkNavigationBarController.rootView)
        vkNavigationBarController.rootView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(52)
        }
    }
}
