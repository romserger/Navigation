//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHederView = ProfileHeaderView()

    let table = UITableView(frame: .zero, style: .grouped)

    let array: [PostViewModel] = [
        PostViewModel(title: "GUGKJK", imagePost: "Smile cat", likes: 2324, views: 232323, discription: "LJGKJKHH"),
        PostViewModel(title: "VJHGHKLJ", imagePost: "Smile cat1", likes: 686, views: 988, discription: "KGIKHKLJ"),
        PostViewModel(title: "JKHLHJ:J", imagePost: "Smile cat2", likes: 87686, views: 989987, discription: "KGKKHG"),
        PostViewModel(title: "HHJLHJL", imagePost: "Smile cat3", likes: 87, views: 87879, discription: "KGJKHLKLL")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .lightGray
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "postTableViewCell")
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
        array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
        cell.setData(postData: array[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
}

