//
//  FeedViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 12.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    private let button = UIButton()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        button.setTitle("Показать пост", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func tapButton() {
        let viewController = PostViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
