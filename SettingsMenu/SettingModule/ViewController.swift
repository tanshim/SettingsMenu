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

    // MARK: - UI

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "baseCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "withDetail")
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
        navigationController?.navigationBar.tintColor = .white
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = cellModel?.label
            cell.imageView?.image = cellModel?.icon
            cell.selectionStyle = .none
            return cell
        case .withDetail:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "withDetail")
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = cellModel?.label
            cell.detailTextLabel?.text = cellModel?.detailText
            cell.imageView?.image = cellModel?.icon
            cell.selectionStyle = .none
            return cell
        case .withSwitch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "withSwitch", for: indexPath) as? SwitchTableViewCell
            cell?.settingModel = cellModel
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        case .withBadge:
            let cell = tableView.dequeueReusableCell(withIdentifier: "withBadge", for: indexPath) as? BadgeTableViewCell
            cell?.accessoryType = .disclosureIndicator
            cell?.settingModel = cellModel
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }

}
