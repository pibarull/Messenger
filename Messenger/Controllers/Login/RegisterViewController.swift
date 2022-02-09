//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Ilia Ershov on 08.02.2022.
//

import UIKit

private enum Constants {

    static let title = "Create Account"
    static let viewsHeight: CGFloat = 52
    static let cornerRadius: CGFloat = 12

    static let firstNameTextFieldPlaceholder = "First Name"
    static let secondNameTextFieldPlaceholder = "Second Name"

    static let emailTextFieldBorderWidth: CGFloat = 1
    static let emailTextFieldPlaceholder = "Email Address"

    static let emailErrorLabelText = "Incorrect Email"
    static let passwordErrorLabelText = "Password is too short"

    static let passwordTextFieldPlaceholder = "Password"

    static let registerButtonTitle = "Register"
}

class RegisterViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let profileImageView = UIImageView()
    private let firstNameTextField = UITextField()
//    private let passwordErrorLabel = UILabel()
    private let secondNameTextField = UITextField()
//    private let passwordErrorLabel = UILabel()
    private let emailTextField = UITextField()
    private let emailErrorLabel = UILabel()
    private let passwordTextField = UITextField()
    private let passwordErrorLabel = UILabel()
    private let registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpScrollView()
        setUpProfileImageView()
        setUpFirstNameTextField()
        setUpSecondNameTextField()
        setUpEmailTextField()
        setUpEmailErrorLabel()
        setUpPasswordTextField()
        setUpPasswordErrorLabel()
        setUpRegisterButton()

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
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(firstNameTextField)
        scrollView.addSubview(secondNameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(emailErrorLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(passwordErrorLabel)
        scrollView.addSubview(registerButton)
    }

    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setUpScrollView() {
        scrollView.frame = view.bounds
        scrollView.clipsToBounds = true
    }

    private func setUpProfileImageView() {
        profileImageView.image = UIImage(systemName: "person")
        profileImageView.tintColor = .lightGray
        profileImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapProfileImageView))
        profileImageView.addGestureRecognizer(gesture)
    }

    @objc private func didTapProfileImageView() {
        print("Change profile")
    }

    private func setUpFirstNameTextField() {
        firstNameTextField.autocapitalizationType = .none
        firstNameTextField.autocorrectionType = .no
        firstNameTextField.returnKeyType = .done
        firstNameTextField.layer.borderWidth = Constants.emailTextFieldBorderWidth
        firstNameTextField.layer.cornerRadius = Constants.cornerRadius
        firstNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        firstNameTextField.placeholder = Constants.firstNameTextFieldPlaceholder

        firstNameTextField.leftView = UIView(frame: .init(x: 0,
                                                      y: 0,
                                                      width: 5,
                                                      height: 0))
        firstNameTextField.rightView = UIView(frame: .init(x: firstNameTextField.right-5,
                                                       y: 0,
                                                       width: 5,
                                                       height: 0))

        firstNameTextField.leftViewMode = .always
        firstNameTextField.leftView?.backgroundColor = .white
        firstNameTextField.rightViewMode = .always
        firstNameTextField.rightView?.backgroundColor = .white
    }

    private func setUpSecondNameTextField() {
        secondNameTextField.autocapitalizationType = .none
        secondNameTextField.autocorrectionType = .no
        secondNameTextField.returnKeyType = .done
        secondNameTextField.layer.borderWidth = Constants.emailTextFieldBorderWidth
        secondNameTextField.layer.cornerRadius = Constants.cornerRadius
        secondNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        secondNameTextField.placeholder = Constants.secondNameTextFieldPlaceholder

        secondNameTextField.leftView = UIView(frame: .init(x: 0,
                                                      y: 0,
                                                      width: 5,
                                                      height: 0))
        secondNameTextField.rightView = UIView(frame: .init(x: secondNameTextField.right-5,
                                                       y: 0,
                                                       width: 5,
                                                       height: 0))

        secondNameTextField.leftViewMode = .always
        secondNameTextField.leftView?.backgroundColor = .white
        secondNameTextField.rightViewMode = .always
        secondNameTextField.rightView?.backgroundColor = .white
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

    private func setUpRegisterButton() {
        registerButton.setTitle(Constants.registerButtonTitle, for: .normal)
        registerButton.backgroundColor = .systemGreen
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        registerButton.layer.cornerRadius = Constants.cornerRadius
        registerButton.layer.masksToBounds = true

        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }

    private func setUpLayout() {
        let textFieldWidth = scrollView.width - 60

        let profileImageViewWidth = scrollView.width/3
        profileImageView.frame = CGRect(x: (scrollView.width - profileImageViewWidth)/2,
                                          y: scrollView.top + 40,
                                          width: profileImageViewWidth,
                                          height: profileImageViewWidth)

        firstNameTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: profileImageView.bottom + 30,
                                           width: textFieldWidth,
                                           height: Constants.viewsHeight)
        
        secondNameTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: firstNameTextField.bottom + 30,
                                           width: textFieldWidth,
                                           height: Constants.viewsHeight)

        emailTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: secondNameTextField.bottom + 30,
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

        registerButton.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                   y: passwordTextField.bottom + 40,
                                   width: textFieldWidth,
                                   height: Constants.viewsHeight)
    }

    @objc private func didTapRegisterButton() {
        firstNameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let firstName = firstNameTextField.text,
              let secondName = secondNameTextField.text,
              !firstName.isEmpty,
              !secondName.isEmpty,
              !email.isEmpty,
              !password.isEmpty else {
                  alertEmptyDataError()
                  return
              }

        // Add Firebase Log In
    }

    private func alertEmptyDataError() {
        let alert = UIAlertController(title: "Error",
                                      message: "Please enter all information to create a new account",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss ",
                              style: .cancel,
                              handler: nil))
        present(alert, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {

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
                passwordErrorLabel.isHidden = false
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            secondNameTextField.becomeFirstResponder()
        }

        if textField == secondNameTextField {
            emailTextField.becomeFirstResponder()
        }

        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }

        if textField == passwordTextField {
            didTapRegisterButton()
        }

        return true
    }
}
