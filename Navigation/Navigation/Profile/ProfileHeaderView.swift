//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    let foto: UIImageView = {
        let foto = UIImageView()
        foto.layer.borderColor = UIColor.white.cgColor
        foto.layer.borderWidth = 3
        foto.layer.cornerRadius = 50
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.image = UIImage(named: "Cat")
        foto.clipsToBounds = true
        return foto
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Hipster cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var button: UIButton = {

        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.opacity = 0.7
        button.layer.masksToBounds = false
        return button
    }()

    init() {
        super.init(frame: .zero)
        constrans()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constrans() {
        self.addSubview(foto)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(button)

        NSLayoutConstraint.activate([
            foto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            foto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            foto.widthAnchor.constraint(equalToConstant: 100),
            foto.heightAnchor.constraint(equalToConstant: 100),
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: foto.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -34),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: foto.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: foto.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),


        ])
    }

    @objc func buttonPressed() {
        print(statusLabel.text ?? "")
    }

}
