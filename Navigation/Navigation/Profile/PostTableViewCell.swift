//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Roman Geraskin on 11.05.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell{

    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "vedmak.official"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imagePost: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.image = UIImage(named: "Smile cat")
        return image
    }()

    let discription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Новые кадры со съемок сериала Ведьмак"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let likes: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.text = "Likes: 312"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let views: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.text = "Views: 240"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        self.addSubview(title)
        self.addSubview(imagePost)
        self.addSubview(discription)
        self.addSubview(likes)
        self.addSubview(views)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imagePost.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            imagePost.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imagePost.heightAnchor.constraint(equalTo: self.widthAnchor),
            discription.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            discription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            discription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            likes.topAnchor.constraint(equalTo: discription.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            views.topAnchor.constraint(equalTo: discription.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(postData: PostViewModel) {
        title.text = postData.title
        imagePost.image = UIImage(named: postData.imagePost)
        discription.text = postData.discription
        likes.text = "Likes: \(postData.likes)"
        views.text = "Views: \(postData.views)"
    }
}

struct PostViewModel {
    var title: String
    var imagePost: String
    var likes: Int
    var views: Int
    var discription: String
}
