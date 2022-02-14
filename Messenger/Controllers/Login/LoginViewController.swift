//
//  LoginViewController.swift
//  Messenger
//
//  Created by Ilia Ershov on 08.02.2022.
//

import UIKit

private enum Constants {

    static let title = "Log In"
    static let registerTitle = "Register"
    static let viewsHeight: CGFloat = 52
    static let cornerRadius: CGFloat = 12

    static let emailTextFieldBorderWidth: CGFloat = 1
    static let emailTextFieldPlaceholder = "Email Address"

    static let emailErrorLabelText = "Incorrect Email"
    static let passwordErrorLabelText = "Password is too short"
    static let requiredFieldLabelText = "This field is required"

    static let passwordTextFieldPlaceholder = "Password"

    static let loginButtonTitle = "Log In"
}

class LoginViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let messengerImageView = UIImageView()
    // TODO: Add validation for email field to conform email regexp
    private let emailTextField = CustomTextField()
        .setPlaceholder(with: Constants.emailTextFieldPlaceholder)
    private let emailErrorLabel = UILabel()
    private let passwordTextField = CustomTextField()
        .setPlaceholder(with: Constants.passwordTextFieldPlaceholder)
    private let passwordErrorLabel = UILabel()
    private let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpScrollView()
        setUpMessengerImageView()
        setUpEmailErrorLabel()
        setUpPasswordErrorLabel()
        setUpLoginButton()

        setUpLayout()
    }

    private func setUpView() {
        emailTextField.delegate = self
        passwordTextField.delegate = self

        view.backgroundColor = .white
        title = Constants.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))

        view.addSubview(scrollView)
        scrollView.addSubview(messengerImageView)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(emailErrorLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(passwordErrorLabel)
        scrollView.addSubview(loginButton)
    }

    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setUpScrollView() {
        scrollView.frame = view.bounds
        scrollView.clipsToBounds = true
    }

    private func setUpMessengerImageView() {
        messengerImageView.image = UIImage(named: "messenger")
    }

    private func setUpEmailErrorLabel() {
        emailErrorLabel.text = Constants.emailErrorLabelText
        emailErrorLabel.textColor = .red
        emailErrorLabel.isHidden = true
    }

    private func setUpPasswordErrorLabel() {
        passwordErrorLabel.text = Constants.passwordErrorLabelText
        passwordErrorLabel.textColor = .red
        passwordErrorLabel.isHidden = true
    }

    private func setUpLoginButton() {
        loginButton.setTitle(Constants.loginButtonTitle, for: .normal)
        loginButton.backgroundColor = .link
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        loginButton.layer.cornerRadius = Constants.cornerRadius
        loginButton.layer.masksToBounds = true

        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }

    private func setUpLayout() {
        let textFieldWidth = scrollView.width - 60

        let messengerImageViewWidth = scrollView.width/3
        messengerImageView.frame = CGRect(x: (scrollView.width - messengerImageViewWidth)/2,
                                          y: scrollView.top + 40,
                                          width: messengerImageViewWidth,
                                          height: messengerImageViewWidth)

        emailTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: messengerImageView.bottom + 30,
                                           width: textFieldWidth,
                                           height: Constants.viewsHeight)

        emailErrorLabel.frame = CGRect(x: emailTextField.left + 5,
                                       y: emailTextField.bottom + 6,
                                       width: emailTextField.width - 5,
                                       height: 20)

        passwordTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                         y: emailErrorLabel.bottom + 6,
                                         width: textFieldWidth,
                                         height: Constants.viewsHeight)

        passwordErrorLabel.frame = CGRect(x: passwordTextField.left + 5,
                                          y: passwordTextField.bottom + 6,
                                          width: passwordTextField.width - 5,
                                          height: 20)

        loginButton.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                   y: passwordTextField.bottom + 40,
                                   width: textFieldWidth,
                                   height: Constants.viewsHeight)
    }

    @objc private func didTapLoginButton() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty,
              !password.isEmpty else {
                  alertEmptyDataError()
                  return
              }

        // Add Firebase Log In
    }

    private func alertEmptyDataError() {
        let alert = UIAlertController(title: "Error",
                                      message: "Please enter email and password",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss ",
                              style: .cancel,
                              handler: nil))
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            guard let text = textField.text else { return }
            if text.isEmpty {
                emailErrorLabel.text = Constants.requiredFieldLabelText
                textField.layer.borderColor = UIColor.red.cgColor
                emailErrorLabel.isHidden = false
            } else if text.count < 12 {
                emailErrorLabel.text = Constants.emailErrorLabelText
                textField.layer.borderColor = UIColor.red.cgColor
                emailErrorLabel.isHidden = false
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                emailErrorLabel.isHidden = true
            }
        }

        if textField == passwordTextField {
            guard let text = textField.text else { return }
            if text.isEmpty {
                passwordErrorLabel.text = Constants.requiredFieldLabelText
                textField.layer.borderColor = UIColor.red.cgColor
                passwordErrorLabel.isHidden = false
            } else if text.count <= 6 {
                passwordErrorLabel.text = Constants.passwordErrorLabelText
                textField.layer.borderColor = UIColor.red.cgColor
                passwordErrorLabel.isHidden = false
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                passwordErrorLabel.isHidden = true
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }

        if textField == passwordTextField {
            didTapLoginButton()
        }

        return true
    }
}
