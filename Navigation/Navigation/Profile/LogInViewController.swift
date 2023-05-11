//
//  LogInViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 06.05.2023.
//

import UIKit

class LogInViewController: UIViewController {

    let scrolView: UIScrollView = {
        let scrol = UIScrollView()
        scrol.isUserInteractionEnabled = true
        scrol.translatesAutoresizingMaskIntoConstraints = false
        return scrol

    }()

    let contentView: UIView = {
        let content = UIView()
        content.isUserInteractionEnabled = true
        content.backgroundColor = .white
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()

    let VKlogo: UIImageView = {
        let foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.image = UIImage(named: "VKLogo")
        return foto
    }()

    let emailPassword: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let separator: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()

    let emailTextField: MyTextFieldView = {
        let email = MyTextFieldView()
        email.placeholder = "Email of phone"
        email.textColor = .black
        email.font = .systemFont(ofSize: 16)
        email.autocapitalizationType = .none
        email.backgroundColor = .systemGray6
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()

    let passwordTextField: MyTextFieldView = {
        let password = MyTextFieldView()
        password.placeholder = "Password"
        password.textColor = .black
        password.font = .systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.backgroundColor = .systemGray6
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    lazy var buttonLogIn: UIButton = {
        let logIn = UIButton()
        logIn.setTitle("Log in", for: .normal)
        logIn.addTarget(self, action: #selector(goToProfilePage), for: .touchUpInside)
        logIn.layer.cornerRadius = 10
        logIn.setTitleColor(.white, for: .normal)
        logIn.isUserInteractionEnabled = true

        logIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logIn.layer.masksToBounds = true
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
    }()

    let notification = NotificationCenter.default


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        constraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(openKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(closeKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    @objc func openKeyboard(notification: NSNotification) {
        print("Клавиатура открылась")
        if let keybordSize =  (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrolView.contentInset.bottom = keybordSize.height + 100
            scrolView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height + 100, right: 0)
        }
    }

    @objc func closeKeyboard() {
        scrolView.contentInset = .zero
        scrolView.verticalScrollIndicatorInsets = .zero
    }

    @objc func goToProfilePage() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }

    func constraints() {

        view.addSubview(scrolView)
        scrolView.addSubview(contentView)
        contentView.addSubview(VKlogo)
        contentView.addSubview(emailPassword)
        emailPassword.addArrangedSubview(emailTextField)
        emailPassword.addArrangedSubview(separator)
        emailPassword.addArrangedSubview(passwordTextField)
        contentView.addSubview(buttonLogIn)

        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrolView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrolView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrolView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            contentView.heightAnchor.constraint(equalTo: scrolView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrolView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor),

            VKlogo.heightAnchor.constraint(equalToConstant: 100),
            VKlogo.widthAnchor.constraint(equalToConstant: 100),
            VKlogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            VKlogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            emailPassword.topAnchor.constraint(equalTo: VKlogo.bottomAnchor, constant: 120),
            emailPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.topAnchor.constraint(equalTo: emailPassword.bottomAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}




