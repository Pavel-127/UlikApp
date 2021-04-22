//
//  UARegisterViewController.swift
//  Ulik
//
//  Created by macbook on 4/13/21.
//

import UIKit
import Firebase

class UARegisterViewController: UIViewController {

    //MARK: - gui variables

    private lazy var nameTextField: UITextField = {
        let name = UITextField()
        name.placeholder = "Placeholder username".localized
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        name.delegate = self

        return name
    }()

    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Placeholder email".localized
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
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

    private lazy var registerButton: UIButton = {
        let register = UIButton()
        register.setTitle(("Register title".localized), for: UIControl.State())
        register.setTitleColor(.blue, for: UIControl.State())
        register.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        register.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        register.translatesAutoresizingMaskIntoConstraints = false

        return register
    }()

    //MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register title".localized
        self.view.backgroundColor = .white
        self.view.addSubview(nameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(registerButton)

        self.updateViewConstraints()
    }

    //MARK: - constraints

    override func updateViewConstraints() {

        self.nameTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
        }

        self.emailTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
        }

        self.passwordTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
        }

        self.registerButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(250)
        }

        super.updateViewConstraints()
    }

    //MARK: - @objc func

    @objc private func registerButtonTapped() {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text!
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    if let result = result {
                        self.navigationController?.pushViewController(UALoginViewController(), animated: true)
                        let ref = Database.database().reference().child("users")
                        ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                    }
                }
            }
        } else {
            self.showErrorAlert()
        }
    }

    //MARK: - error processing

    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error title".localized,
                                      message: "Message title".localized,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - extensions

extension UARegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        return true
    }
}
