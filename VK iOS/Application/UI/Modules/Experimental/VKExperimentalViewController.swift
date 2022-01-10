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
        button.setLeftSideIcon(UIImage(named: "add_12")!.withRenderingMode(.alwaysTemplate))
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
        
        let actionButtons = [
            VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearancePrimary(), title: "Сохранить в закладках", completionHandler: {
                print("Сохранить в закладках")
            }),
            VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearancePrimary(), title: "Закрепить запись", completionHandler: {
                print("Закрепить запись")
            }),
            VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearancePrimary(), title: "Выключить комментирование", completionHandler: {
                print("Выключить комментирование")
            }),
            VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearancePrimary(), title: "Закрепить запись", completionHandler: {
                print("Закрепить запись")
            }),
            VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearanceDestructive(), title: "Удалить запись", completionHandler: {
                print("Удалить запись")
            })
            
        ]
        
        let cancelButton = VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearanceCancel(), title: "Отменить") {
            print("Отменить")
        }
        
        let vc = VKActionSheetViewController(actionButtons: actionButtons, cancelButton: cancelButton)
        
        let actionSheet = UIAlertController(title: "A", message: "B", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Button 1", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Button 2", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Button 3", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Close", style: .cancel))

        present(vc, animated: true)
    }
}
