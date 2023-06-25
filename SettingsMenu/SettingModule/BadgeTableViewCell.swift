//
//  BadgeTableViewCell.swift
//  SettingsMenu
//
//  Created by Sultan on 26.06.2023.
//

import UIKit

class BadgeTableViewCell: UITableViewCell {

    var settingModel: Setting? {
        didSet {
            label.text = settingModel?.label
            iconImageView.image = settingModel?.icon
        }
    }

    let diameter: CGFloat = 30

    // MARK: - UI

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = diameter / 2
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        label.textColor = .white
        label.clipsToBounds = true
        label.text = "1"
        return label
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
        contentView.addSubview(badgeLabel)
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
        badgeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.size.equalTo(30)
        }
    }

}
