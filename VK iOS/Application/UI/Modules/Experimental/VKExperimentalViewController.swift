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
            VKActionSheetIconButton(appearance: VKActionSheetIconButtonAppearancePrimary(), iconImage: UIImage(named: "pen_outline_16")!.withRenderingMode(.alwaysTemplate), title: "Редактировать плейлист", completionHandler: {
                print("Редактировать плейлист")
            }),
            VKActionSheetIconButton(appearance: VKActionSheetIconButtonAppearancePrimary(), iconImage: UIImage(named: "list_play_outline_16")!.withRenderingMode(.alwaysTemplate), title: "Слушать далее", completionHandler: {
                print("Слушать далее")
            }),
            VKActionSheetIconButton(appearance: VKActionSheetIconButtonAppearancePrimary(), iconImage: UIImage(named: "share_16")!.withRenderingMode(.alwaysTemplate), title: "Поделиться", completionHandler: {
                print("Поделиться")
            }),
            VKActionSheetIconButton(appearance: VKActionSheetIconButtonAppearancePrimary(), iconImage: UIImage(named: "copy_24")!.withRenderingMode(.alwaysTemplate), title: "Скопировать ссылку", completionHandler: {
                print("Скопировать ссылку")
            }),
            VKActionSheetIconButton(appearance: VKActionSheetIconButtonAppearanceDestructive(), iconImage: UIImage(named: "delete_outline_24")!.withRenderingMode(.alwaysTemplate), title: "Удалить плейлист", completionHandler: {
                print("Удалить плейлист")
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
