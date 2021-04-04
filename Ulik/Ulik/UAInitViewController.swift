//
//  ViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAInitViewController: UIViewController {

//    private lazy var backgroundImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "background")
//        imageView.contentMode = .scaleAspectFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        return imageView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.addSubview(backgroundImageView)
    }

    @objc private func continueScree() {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([
        UAMainViewController(),
        UAStatisticsViewController(),
        UAListViewController(),
        UASettingsViewController()],
        animated: true)

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarController)
    }
}
