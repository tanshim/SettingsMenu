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
}

extension Setting {
    static var settings: [[Setting]] = [
        [
            Setting(label: "Авиарежим", type: .withSwitch, icon: UIImage(systemName: "airplane")),
            Setting(label: "Wi-FI", type: .withDetail,
                 icon: UIImage(systemName: "wifi.square.fill"), detailText: "Не подключено"),
            Setting(label: "Bluetooth", type: .withDetail,
                 icon: UIImage(systemName: "person.icloud"), detailText: "Вкл."),
            Setting(label: "Cотовая связь", type: .base,
                 icon: UIImage(systemName: "antenna.radiowaves.left.and.right")),
            Setting(label: "Режим модема", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "VPN", type: .withSwitch, icon: UIImage(systemName: "airplane"))
        ],
        [
            Setting(label: "Уведомления", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "Звуки, тактильные сигналы", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "Не беспокоить", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "Экранное время", type: .base, icon: UIImage(systemName: "airplane"))
        ],
        [
            Setting(label: "Основное", type: .withBadge, icon: UIImage(systemName: "airplane")),
            Setting(label: "Пункт управления", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "Экран и яркость", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "Экран \"Домой\"", type: .base, icon: UIImage(systemName: "airplane")),
            Setting(label: "Универсальный доступ", type: .base, icon: UIImage(systemName: "airplane"))
        ]
    ]
}


