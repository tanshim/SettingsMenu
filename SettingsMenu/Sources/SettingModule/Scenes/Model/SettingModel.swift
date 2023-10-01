//
//  SettingModel.swift
//  SettingsMenu
//
//  Created by Sultan on 24.06.2023.
//

import Foundation
import UIKit

enum SettingType: String {
    case base
    case withSwitch
    case withDetail
    case withBadge
}

struct Setting {
    var label: String
    var type: SettingType
    var icon: UIImage?
    var detailText: String?
    var iconBackgroundColor: UIColor?
}

extension Setting {
    static var settings: [[Setting]] = [
        [
            Setting(label: "Авиарежим", type: .withSwitch, icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange),
            Setting(label: "Wi-FI", type: .withDetail,
                 icon: UIImage(systemName: "wifi"), detailText: "Не подключено", iconBackgroundColor: .systemBlue),
            Setting(label: "Bluetooth", type: .withDetail,
                 icon: UIImage(named: "bluetooth"), detailText: "Вкл.", iconBackgroundColor: .systemBlue),
            Setting(label: "Cотовая связь", type: .base,
                 icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen),
            Setting(label: "Режим модема", type: .base, icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen),
            Setting(label: "VPN", type: .withSwitch, icon: UIImage(named: "vpn"), iconBackgroundColor: .white)
        ],
        [
            Setting(label: "Уведомления", type: .base, icon: UIImage(systemName: "bell.fill"), iconBackgroundColor: .systemRed),
            Setting(label: "Звуки, тактильные сигналы", type: .base, icon: UIImage(systemName: "speaker.wave.2.fill"), iconBackgroundColor: .systemPink),
            Setting(label: "Не беспокоить", type: .base, icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo),
            Setting(label: "Экранное время", type: .base, icon: UIImage(systemName: "hourglass.circle.fill"), iconBackgroundColor: .systemIndigo)
        ],
        [
            Setting(label: "Основные", type: .withBadge, icon: UIImage(systemName: "gear"), iconBackgroundColor: .lightGray),
            Setting(label: "Пункт управления", type: .base, icon: UIImage(systemName: "command.square"), iconBackgroundColor: .lightGray),
            Setting(label: "Экран и яркость", type: .base, icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue),
            Setting(label: "Экран \"Домой\"", type: .base, icon: UIImage(systemName: "circle.grid.3x3.circle.fill"), iconBackgroundColor: .blue),
            Setting(label: "Универсальный доступ", type: .base, icon: UIImage(systemName: "figure.arms.open"), iconBackgroundColor: .systemBlue)
        ]
    ]
}
