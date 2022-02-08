//
//  ViewController.swift
//  Messenger
//
//  Created by Ilia Ershov on 08.02.2022.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")

        presentFirstViewController(isLoggedIn: isLoggedIn)
    }

    private func presentFirstViewController(isLoggedIn: Bool) {
        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

}

