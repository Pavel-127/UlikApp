//
//  UASettingsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit
import SnapKit

class UASettingsViewController: UIViewController {

    //MARK: - gui variables

    private lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle(("Login title".localized), for: UIControl.State())
        login.setTitleColor(.blue, for: UIControl.State())
        login.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.addTarget(self, action: #selector(loginButtonTapped), for: .touchDown)

        return login
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

    private lazy var currencyTextField: UITextField = {
        let currency = UITextField()
        currency.translatesAutoresizingMaskIntoConstraints = false
        currency.placeholder = "Placeholder currency".localized
        currency.borderStyle = .roundedRect
        currency.inputView = self.picker
        currency.inputAccessoryView = self.doneToolBar

        return currency
    }()

    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false

        return picker
    }()

    private lazy var doneToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil),
            UIBarButtonItem(barButtonSystemItem: .done,
                            target: self,
                            action: #selector(doneTapped))]

        toolbar.sizeToFit()

        return toolbar
    }()

    //MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fourth title".localized
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.view.addSubview(loginButton)
        self.view.addSubview(registerButton)
        self.view.addSubview(currencyTextField)
        self.updateViewConstraints()
        UAUserDefaults.sh.loadCurrency()
    }

    //MARK: - constraints

    override func updateViewConstraints() {
        self.loginButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.right.equalToSuperview().inset(5)
        }

        self.registerButton.snp.updateConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(5)
        }
        
        self.currencyTextField.snp.updateConstraints { (make) in
            make.top.equalTo(self.registerButton.snp.bottom).offset(40)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(350)
        }

        super.updateViewConstraints()
    }

    //MARK: - @objc func

    @objc private func loginButtonTapped() {
        navigationController?.pushViewController(UALoginViewController(), animated: true)
    }

    @objc private func registerButtonTapped() {
        navigationController?.pushViewController(UARegisterViewController(), animated: true)
    }

    @objc private func doneTapped() {
        self.currencyTextField.resignFirstResponder()
        UAUserDefaults.sh.saveCurrency(UACurrency.BYN)
    }
}

//MARK: - extensions

extension UASettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UACurrency.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UACurrency.stringCurrency[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.currencyTextField.text = UACurrency.stringCurrency[row]

    }
}
