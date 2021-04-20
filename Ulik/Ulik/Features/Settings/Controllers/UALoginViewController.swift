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
        email.placeholder = NSLocalizedString("Placeholder email", comment: "")
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false

        return email
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = NSLocalizedString("Placeholder password", comment: "")
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false

        return password
    }()

    private lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle(NSLocalizedString("Login title", comment: ""), for: UIControl.State())
        login.setTitleColor(.blue, for: UIControl.State())
        login.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        return login
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Login title", comment: "")
        self.view.backgroundColor = .white
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(5)
        }

        super.updateViewConstraints()
    }

    @objc private func loginButtonTapped() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UAMainTabBarController())
                } else {
                    (email != email && password != password)
                    self.showErrorLoginAndEmailAlert()
                }
            }
        } else {
            self.showErrorAlert()
        }
    }

    private func showErrorAlert() {
        let alert = UIAlertController(title: NSLocalizedString("Error title", comment: ""), message: NSLocalizedString("Message title", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func showErrorLoginAndEmailAlert() {
        let alert = UIAlertController(title: NSLocalizedString("Error title", comment: ""), message: NSLocalizedString("Message error", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
