//
//  DetailTableViewCell.swift
//  SettingsMenu
//
//  Created by Sultan on 26.06.2023.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {

    var settingModel: Setting? {
        didSet {
            label.text = settingModel?.label
            detailLabel.text = settingModel?.detailText
            iconImageView.image = settingModel?.icon
            iconImageView.backgroundColor = settingModel?.iconBackgroundColor
        }
    }

    // MARK: - UI

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
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

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        detailLabel.text = nil
    }

    // MARK: - Setup Views

    private func setupViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(detailLabel)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.height.equalTo(33)
            make.width.equalTo(30)
        }
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)

        }
    }

}
