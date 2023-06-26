//
//  ViewController.swift
//  SettingsMenu
//
//  Created by Sultan on 24.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var settings: [[Setting]]?
    let spacing: CGFloat = 60.0

    // MARK: - UI

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: "baseCell")
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "withDetail")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "withSwitch")
        tableView.register(BadgeTableViewCell.self, forCellReuseIdentifier: "withBadge")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        settings = Setting.settings
        setupViews()
        setupConstraints()
    }

    // MARK: - Setup

    func setupViews() {
        view.backgroundColor = .white
        title = "Настройки"
        view.addSubview(settingsTableView)
    }

    func setupConstraints() {
        settingsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = settings?[indexPath.section][indexPath.row]
        switch cellModel?.type {
        case .base:
            let cell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as? BaseTableViewCell
            cell?.accessoryType = .disclosureIndicator
            cell?.settingModel = cellModel
            cell?.separatorInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
            return cell ?? UITableViewCell()
        case .withDetail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "withDetail", for: indexPath) as? DetailTableViewCell
            cell?.accessoryType = .disclosureIndicator
            cell?.settingModel = cellModel
            cell?.separatorInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
            return cell ?? UITableViewCell()
        case .withSwitch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "withSwitch", for: indexPath) as? SwitchTableViewCell
            cell?.settingModel = cellModel
            cell?.separatorInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
            return cell ?? UITableViewCell()
        case .withBadge:
            let cell = tableView.dequeueReusableCell(withIdentifier: "withBadge", for: indexPath) as? BadgeTableViewCell
            cell?.accessoryType = .disclosureIndicator
            cell?.settingModel = cellModel
            cell?.separatorInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
            return cell ?? UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellModel = settings?[indexPath.section][indexPath.row]
        print("Нажата ячейка \(cellModel?.label ?? "")")
        let viewController = DetailViewController()
        viewController.settingModel = cellModel
        navigationController?.pushViewController(viewController, animated: true)
    }

}
