//
//  PostViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 12.04.2023.
//

import UIKit

class PostViewController: UIViewController {

    private var post: Post = Post(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        self.navigationItem.title = post.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(newPage))
    }

    func setPost(post: Post) {
        self.post = post
    }
    @objc func newPage() {
        let viewController = InfoViewController()
        present(viewController, animated: true)
    }




}
