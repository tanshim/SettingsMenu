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
            cell.imageView?.backgroundColor = cellModel?.iconBackgroundColor
            cell.imageView?.tintColor = .white
            cell.imageView?.layer.cornerRadius = 4
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.contentMode = .center
            return cell
        case .withDetail:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "withDetail")
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = cellModel?.label
            cell.detailTextLabel?.text = cellModel?.detailText
            cell.imageView?.image = cellModel?.icon
            cell.imageView?.tintColor = .white
            cell.imageView?.backgroundColor = cellModel?.iconBackgroundColor
            cell.imageView?.layer.cornerRadius = 4
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.contentMode = .center
            return cell
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
