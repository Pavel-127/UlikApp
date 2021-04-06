//
//  UAMainTabBarController.swift
//  Ulik
//
//  Created by macbook on 4/6/21.
//

import UIKit

class UAMainTabBarController: UITabBarController {

    private lazy var mainTabBarItem: UITabBarItem = {
        let view = UITabBarItem(title: "Главня",
                                image: UIImage(systemName: "cart"),
                                selectedImage: UIImage(systemName: "cart.fill"))

        return view
    }()

    private lazy var statisticsTabBarItem: UITabBarItem = {
        let view = UITabBarItem(title: "Статистика",
                                 image: UIImage(systemName: "chart.bar.xaxis"),
                                 selectedImage: UIImage(systemName: "chart.bar.xaxis.fill"))
        return view
    }()

    private lazy var listTabBarItem: UITabBarItem = {
        let view = UITabBarItem(title: "Списки",
                                 image: UIImage(systemName: "newspaper"),
                                 selectedImage: UIImage(systemName: "newspaper.fill"))
        return view
    }()

    private lazy var settingsTabBarItem: UITabBarItem = {
        let view = UITabBarItem(title: "Настройки",
                                 image: UIImage(systemName: "gear"),
                                 selectedImage: UIImage(systemName: "gear.fill"))
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTabBar()
        self.setupTabBarAppearance()
    }

    private func setUpTabBar() {
        let mainController = UAMainViewController()
        mainController.tabBarItem = self.mainTabBarItem

        let statisticsController = UAStatisticsViewController()
        statisticsController.tabBarItem = self.statisticsTabBarItem

        let listController = UAListViewController()
        listController.tabBarItem = self.listTabBarItem

        let settingsController = UASettingsViewController()
        settingsController.tabBarItem = self.settingsTabBarItem

        let controllers = [mainController, statisticsController, listController, settingsController]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }

    private func setupTabBarAppearance() {
        self.tabBar.tintColor = UIColor(named: "accentColor")
        self.tabBar.unselectedItemTintColor = UIColor(named: "mainTextColor")
        self.tabBar.backgroundColor = .white
    }
}