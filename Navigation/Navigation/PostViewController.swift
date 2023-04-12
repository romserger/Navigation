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
    }

    func setPost(post: Post) {
        self.post = post
    }



}
