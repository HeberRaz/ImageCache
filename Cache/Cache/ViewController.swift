//
//  ViewController.swift
//  Cache
//
//  Created by Heber Alvarez on 23/02/23.
//

import UIKit

class ViewController: UIViewController {

    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addButton()
    }

    private func addButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap me", for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
        setButtonAnchors()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    private func setButtonAnchors() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1/2)
        ])
    }

    @objc private func didTapButton() {
        let secondViewController = SecondViewController()
        self.navigationController?.present(secondViewController, animated: true)
    }
}

