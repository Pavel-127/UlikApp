//
//  UALoginViewController.swift
//  Ulik
//
//  Created by macbook on 4/13/21.
//

import UIKit
import Firebase

class UALoginViewController: UIViewController, UITextFieldDelegate {

    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Placeholder email".localized
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        email.delegate = self

        return email
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Placeholder password".localized
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        password.delegate = self

        return password
    }()

    private lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle(("Login title".localized), for: UIControl.State())
        login.setTitleColor(.blue, for: UIControl.State())
        login.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        return login
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login title".localized
        self.view.backgroundColor = .white
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.updateViewConstraints()
    }

    override func updateViewConstraints() {

        self.emailTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
        }

        self.passwordTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
        }

        self.loginButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(250)
        }

        super.updateViewConstraints()
    }

    @objc private func loginButtonTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if !email.isEmpty && !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UAMainTabBarController())
                } else {
                    self.showErrorLoginAndEmailAlert()
                }
            }
        } else {
            self.showErrorAlert()
        }
    }

    private func showErrorAlert() {
        let alert = UIAlertController(title: ("Error title".localized),
                                      message: "Message title".localized,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func showErrorLoginAndEmailAlert() {
        let alert = UIAlertController(title: ("Error title".localized),
                                      message: "Message error".localized,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
