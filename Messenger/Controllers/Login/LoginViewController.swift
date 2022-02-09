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

    static let passwordTextFieldPlaceholder = "Password"

    static let loginButtonTitle = "Log In"
}

class LoginViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let messengerImageView = UIImageView()
    private let emailTextField = UITextField()
    private let emailErrorLabel = UILabel()
    private let passwordTextField = UITextField()
    private let passwordErrorLabel = UILabel()
    private let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpScrollView()
        setUpMessengerImageView()
        setUpEmailTextField()
        setUpEmailErrorLabel()
        setUpPasswordTextField()
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

    // TODO: Add validation for email field to conform email regexp
    private func setUpEmailTextField() {
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .done
        emailTextField.layer.borderWidth = Constants.emailTextFieldBorderWidth
        emailTextField.layer.cornerRadius = Constants.cornerRadius
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.placeholder = Constants.emailTextFieldPlaceholder

        emailTextField.leftView = UIView(frame: .init(x: 0,
                                                      y: 0,
                                                      width: 5,
                                                      height: 0))
        emailTextField.rightView = UIView(frame: .init(x: emailTextField.right-5,
                                                       y: 0,
                                                       width: 5,
                                                       height: 0))

        emailTextField.leftViewMode = .always
        emailTextField.leftView?.backgroundColor = .white
        emailTextField.rightViewMode = .always
        emailTextField.rightView?.backgroundColor = .white
    }

    private func setUpEmailErrorLabel() {
        emailErrorLabel.text = Constants.emailErrorLabelText
        emailErrorLabel.textColor = .red
        emailErrorLabel.isHidden = true
    }


    private func setUpPasswordTextField() {
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .continue
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = Constants.emailTextFieldBorderWidth
        passwordTextField.layer.cornerRadius = Constants.cornerRadius
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.placeholder = Constants.passwordTextFieldPlaceholder

        passwordTextField.leftView = UIView(frame: .init(x: 0,
                                                      y: 0,
                                                      width: 5,
                                                      height: 0))
        passwordTextField.rightView = UIView(frame: .init(x: emailTextField.right-5,
                                                       y: 0,
                                                       width: 5,
                                                       height: 0))

        passwordTextField.leftViewMode = .always
        passwordTextField.leftView?.backgroundColor = .white
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView?.backgroundColor = .white
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
                                       height: 16)

        passwordTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: emailErrorLabel.bottom + 6,
                                         width: textFieldWidth,
                                         height: Constants.viewsHeight)

        passwordErrorLabel.frame = CGRect(x: passwordTextField.left + 5,
                                          y: passwordTextField.bottom + 6,
                                          width: passwordTextField.width - 5,
                                          height: 16)

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
            if text.count < 12 {
                textField.layer.borderColor = UIColor.red.cgColor
                emailErrorLabel.isHidden = false
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                emailErrorLabel.isHidden = true
            }
        }

        if textField == passwordTextField {
            guard let text = textField.text else { return }
            if text.count <= 6 {
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
