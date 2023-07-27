//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let photosViewController = PhotosViewController()

    let profileHederView = ProfileHeaderView()

    let table = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .lightGray
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "postTableViewCell")
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photosTableViewCell")
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate {

}

extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return Data.postArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let photos = tableView.dequeueReusableCell(withIdentifier: "photosTableViewCell", for: indexPath) as! PhotosTableViewCell
            photos.selectionStyle = .none
            photos.delegate = self
            return photos
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
            cell.setData(postData: Data.postArray[indexPath.row])
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 0 {
            return 250
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            touchViewAction()
        }
    }
}

extension ProfileViewController: ProtoTableViewCellDelegate {
    func touchViewAction() {
        navigationController?.pushViewController(photosViewController, animated: true)
    }


}
