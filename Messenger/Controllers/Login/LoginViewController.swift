//
//  LoginViewController.swift
//  Messenger
//
//  Created by Ilia Ershov on 08.02.2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Log In"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
    }

    @objc private func didTapRegister() {
        let vc = RegisterViewController()
//        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
}
