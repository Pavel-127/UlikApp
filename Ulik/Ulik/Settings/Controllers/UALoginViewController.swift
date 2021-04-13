//
//  UALoginViewController.swift
//  Ulik
//
//  Created by macbook on 4/13/21.
//

import UIKit

class UALoginViewController: UIViewController {

    private lazy var nameTextField: UITextField = {
        let name = UITextField()
        name.placeholder = "Введите имя пользователя"
        name.backgroundColor = .lightGray
        name.translatesAutoresizingMaskIntoConstraints = false

        return name
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Введите пароль"
        password.backgroundColor = .lightGray
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false

        return password
    }()

    private lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Войти", for: UIControl.State())
        login.setTitleColor(.blue, for: UIControl.State())
        login.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        return login
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(nameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.updateViewConstraints()
    }

    override func updateViewConstraints() {

        self.nameTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
        }

        self.passwordTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameTextField.snp.bottom).offset(20)
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
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UAMainTabBarController())
    }
}
