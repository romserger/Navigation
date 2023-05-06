//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileHeadView: ProfileHeaderView = ProfileHeaderView()

    let newButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("New Button", for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileHeadView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeadView)
        view.addSubview(newButton)
        NSLayoutConstraint.activate([
            profileHeadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeadView.heightAnchor.constraint(equalToConstant: 220),
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
