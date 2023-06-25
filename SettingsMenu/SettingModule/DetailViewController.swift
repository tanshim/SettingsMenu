//
//  DetailViewController.swift
//  SettingsMenu
//
//  Created by Sultan on 26.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var settingModel: Setting?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Setup

    func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemGray
        title = settingModel?.label
    }

}
