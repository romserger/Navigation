//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileHeadView: ProfileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeadView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeadView.frame = view.frame
    }
}
