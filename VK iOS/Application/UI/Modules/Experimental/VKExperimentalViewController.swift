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
        let actions = [
            VKActionSheetInformativeButton(appearance: VKActionSheetInformativeButtonAppearancePrimary(), iconImage: UIImage(named: "settings_outline_28")!.withRenderingMode(.alwaysTemplate), title: "Качество", description: "Авто", completionHandler: {
                print("Качество")
            }),
            VKActionSheetInformativeButton(appearance: VKActionSheetInformativeButtonAppearancePrimary(), iconImage: UIImage(named: "subtitles_outline_28")!.withRenderingMode(.alwaysTemplate), title: "Субтитры", description: "Отсутствуют", completionHandler: {
                print("Субтитры")
            }, isEnabled: false),
            VKActionSheetInformativeButton(appearance: VKActionSheetInformativeButtonAppearancePrimary(), iconImage: UIImage(named: "play_speed_outline_28")!.withRenderingMode(.alwaysTemplate), title: "Скорость воспроизведения", description: "Обычная", completionHandler: {
                print("Скорость воспроизведения")
            })
        ]
        
        let cancelAction = VKActionSheetTextButton(appearance: VKActionSheetTextButtonAppearanceCancel(), title: "Отменить") {
            print("Отменить")
        }
        
        let vc = VKActionSheetViewController(title: "Asdasdaasd", actionButtons: actions, cancelButton: cancelAction)
        vc.setTitle(nil)

        present(vc, animated: true)
    }
}
