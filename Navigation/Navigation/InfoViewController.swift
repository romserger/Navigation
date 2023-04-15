//
//  InfoViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 15.04.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private let alertButton = UIButton()
    let alert = UIAlertController(title: "Заголовок", message: "Сообщение", preferredStyle: .alert)
    let firstAlertActoin = UIAlertAction(title: "Первый Экшен", style: .destructive) {_ in
        print("Tab Action")
    }
    private lazy var secondAlertAction = UIAlertAction(title: "Второй Экшен", style: .default) {_ in
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupButton()
        alert.addAction(firstAlertActoin)
        alert.addAction(secondAlertAction)
    }

    func setupButton() {
        alertButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)

        alertButton.setTitle("Показать Аллерт", for: .normal)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertButton)
        NSLayoutConstraint.activate([
           alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc func openAlert() {
        present(alert, animated: true)
    }
}
