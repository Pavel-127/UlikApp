//
//  UARegisterViewController.swift
//  Ulik
//
//  Created by macbook on 4/13/21.
//

import UIKit

class UARegisterViewController: UIViewController {

    private lazy var nameTextField: UITextField = {
        let name = UITextField()
        name.placeholder = "Введите имя пользователя"
        name.backgroundColor = .lightGray
        name.translatesAutoresizingMaskIntoConstraints = false

        return name
    }()

    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Введите Email"
        email.backgroundColor = .lightGray
        email.translatesAutoresizingMaskIntoConstraints = false

        return email
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Введите пароль"
        password.backgroundColor = .lightGray
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false

        return password
    }()

    private lazy var registerButton: UIButton = {
        let register = UIButton()
        register.setTitle("Регистрация", for: UIControl.State())
        register.setTitleColor(.blue, for: UIControl.State())
        register.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        register.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        register.translatesAutoresizingMaskIntoConstraints = false

        return register
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(nameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(registerButton)

        self.updateViewConstraints()
    }

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
        }

        super.updateViewConstraints()
    }

    @objc private func registerButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UAMainTabBarController())
    }
}
