//
//  UASettingsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit
import SnapKit

class UASettingsViewController: UIViewController {

    private lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Войти", for: UIControl.State())
        login.setTitleColor(.blue, for: UIControl.State())
        login.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.addTarget(self, action: #selector(loginButtonTapped), for: .touchDown)

        return login
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
        self.title = "Настройки"
        self.view.backgroundColor = .white
        self.view.addSubview(loginButton)
        self.view.addSubview(registerButton)
        self.updateViewConstraints()
    }

    override func updateViewConstraints() {
        self.loginButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.right.equalToSuperview().inset(5)
        }
        self.registerButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(5)
        }
        super.updateViewConstraints()
    }

    @objc private func loginButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UALoginViewController())
    }

    @objc private func registerButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UARegisterViewController())
    }
}
