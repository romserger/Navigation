//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatarImageView: UIImageView = {
        let foto = UIImageView()
        foto.layer.borderColor = UIColor.white.cgColor
        foto.layer.borderWidth = 3
        foto.layer.cornerRadius = 50
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.image = UIImage(named: "Cat")
        foto.clipsToBounds = true
        return foto
    }()

    let fullNameLabel: UILabel = {
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

    lazy var setStatusButton: UIButton = {

        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

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

    let statusTextField: UITextField = {
        let text = UITextField()
        text.font = .systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        text.textColor = .black
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        text.backgroundColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()


    init() {
        super.init(frame: .zero)
        constrans()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constrans() {
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)


        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),


            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

        ])
    }

    @objc func buttonPressed() {

        statusLabel.text = statusTextField.text
        print(statusLabel.text ?? "")
    }

}
