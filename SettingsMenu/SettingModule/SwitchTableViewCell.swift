//
//  BaseTableViewCell.swift
//  SettingsMenu
//
//  Created by Sultan on 24.06.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    var settingModel: Setting? {
        didSet {
            label.text = settingModel?.label
            iconImageView.image = settingModel?.icon
        }
    }

    // MARK: - UI

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch(frame: .zero)
        return uiSwitch
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(uiSwitch)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.size.equalTo(24)
        }
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        uiSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }

}
