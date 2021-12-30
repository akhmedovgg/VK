//
//  VKExperimentalViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/12/21.
//

import UIKit

class VKExperimentalViewController: UIViewController {
    let primaryButton: VKButton = {
        let button = VKButton(appearance: VKButtonAppearancePrimary(), size: VKButtonSizeMediumWithoutIcon())
        button.setLeftSideIcon(UIImage(named: "add/white")!)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel.text = "Add Friend"
        button.titleLabel.textAlignment = .center
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = VKColor(hex: "#A3A3A3FF")
        primaryButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)

        view.addSubview(primaryButton)
        
//        UIAlertController(title: <#T##String?#>, message: <#T##String?#>, axis: .)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            primaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            primaryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            primaryButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 2),
            primaryButton.heightAnchor.constraint(equalToConstant: primaryButton.size.frameHeight)
        ])
    }
    
    @objc func didTap(_ sender: UIControl) {
        let actions = [
            VKAlertAction(style: .cancel, title: "Отмена", completionHandler: {
                print("no")
            }),
            VKAlertAction(style: .destructive, title: "Удалить", completionHandler: {
                print("yes")
            })
        ]
        
        let controller = VKAlertViewController(
            title: "Удаление документа",
            message: "Вы уверены, что хотите удалить этот документ?",
            axis: .horizontal,
            actions: actions)
        
        present(controller, animated: true)
    }
}
