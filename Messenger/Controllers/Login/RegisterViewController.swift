//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Ilia Ershov on 08.02.2022.
//

//import PhotosUI
//import SwiftUI
import UIKit

private enum Constants {

    static let title = "Create Account"
    static let viewsHeight: CGFloat = 52
    static let cornerRadius: CGFloat = 12

    static let profileImageBorderWidth: CGFloat = 2
    static let firstNameTextFieldPlaceholder = "First Name"
    static let secondNameTextFieldPlaceholder = "Second Name"

    static let emailTextFieldBorderWidth: CGFloat = 1
    static let emailTextFieldPlaceholder = "Email Address"

    static let emailErrorLabelText = "Incorrect Email"
    static let passwordErrorLabelText = "Password is too short"
    static let requiredFieldLabelText = "This field is required"

    static let passwordTextFieldPlaceholder = "Password"

    static let registerButtonTitle = "Register"
}

class RegisterViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let profileImageView = UIImageView()
    private let firstNameTextField = CustomTextField()
        .setPlaceholder(with: Constants.firstNameTextFieldPlaceholder)
    private let firstNameErrorLabel = UILabel()
    private let secondNameTextField = CustomTextField()
        .setPlaceholder(with: Constants.secondNameTextFieldPlaceholder)
    private let secondNameErrorLabel = UILabel()
    // TODO: Add validation for email field to conform email regexp
    private let emailTextField = CustomTextField()
        .setPlaceholder(with: Constants.emailTextFieldPlaceholder)
    private let emailErrorLabel = UILabel()
    private let passwordTextField = CustomTextField()
        .setPlaceholder(with: Constants.passwordTextFieldPlaceholder)
    private let passwordErrorLabel = UILabel()
    private let registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpScrollView()
        setUpProfileImageView()
        setUpFirstNameErrorLabel()
        setUpSecondNameErrorLabel()
        setUpEmailErrorLabel()
        setUpPasswordErrorLabel()
        setUpRegisterButton()
    }

    override func viewDidLayoutSubviews() {
        setUpLayout()
    }

    private func setUpView() {
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
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
        scrollView.addSubview(firstNameErrorLabel)
        scrollView.addSubview(secondNameTextField)
        scrollView.addSubview(secondNameErrorLabel)
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
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = Constants.profileImageBorderWidth
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapProfileImageView))
        profileImageView.addGestureRecognizer(gesture)
    }

    @objc private func didTapProfileImageView() {
        presentPhotoActionSheet()
    }

    private func setUpFirstNameErrorLabel() {
        firstNameErrorLabel.text = Constants.requiredFieldLabelText
        firstNameErrorLabel.textColor = .red
        firstNameErrorLabel.isHidden = true
    }

    private func setUpSecondNameErrorLabel() {
        secondNameErrorLabel.text = Constants.requiredFieldLabelText
        secondNameErrorLabel.textColor = .red
        secondNameErrorLabel.isHidden = true
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
        profileImageView.layer.cornerRadius = profileImageView.width/2

        firstNameTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: profileImageView.bottom + 30,
                                           width: textFieldWidth,
                                           height: Constants.viewsHeight)

        firstNameErrorLabel.frame = CGRect(x: firstNameTextField.left + 5,
                                           y: firstNameTextField.bottom + 6,
                                           width: firstNameTextField.width - 5,
                                           height: 20)
        
        secondNameTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                           y: firstNameErrorLabel.bottom + 6,
                                           width: textFieldWidth,
                                           height: Constants.viewsHeight)

        secondNameErrorLabel.frame = CGRect(x: secondNameTextField.left + 5,
                                            y: secondNameTextField.bottom + 6,
                                            width: secondNameTextField.width - 5,
                                            height: 20)

        emailTextField.frame = CGRect(x: (scrollView.width - textFieldWidth)/2,
                                      y: secondNameErrorLabel.bottom + 6,
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

        if textField == firstNameTextField {
            guard let text = textField.text else { return }
            if text.isEmpty {
                firstNameErrorLabel.text = Constants.requiredFieldLabelText
                textField.layer.borderColor = UIColor.red.cgColor
                firstNameErrorLabel.isHidden = false
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                firstNameErrorLabel.isHidden = true
            }
        }

        if textField == secondNameTextField {
            guard let text = textField.text else { return }
            if text.isEmpty {
                secondNameErrorLabel.text = Constants.requiredFieldLabelText
                textField.layer.borderColor = UIColor.red.cgColor
                secondNameErrorLabel.isHidden = false
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                secondNameErrorLabel.isHidden = true
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

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How would you like to select a picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(.init(title: "Cancel",
                                    style: .cancel,
                                    handler: nil))
        actionSheet.addAction(.init(title: "Take photo",
                                    style: .default,
                                    handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(.init(title: "Select photo from library",
                                    style: .default,
                                    handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
    }

    private func presentCamera() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .camera
        present(vc, animated: true)
    }

    private func presentPhotoPicker() {
//        if #available(iOS 14, *) {
//            let vc = PHPickerViewController()
//        } else {
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = .photoLibrary
            present(vc, animated: true)
//        }
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedPicture = info[.editedImage] as? UIImage else { return }
        self.profileImageView.image = selectedPicture
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
