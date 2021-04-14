//
//  UAMainViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAMainViewController: UITableViewController {

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.5

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Главная"

        let addButton = UIBarButtonItem(systemItem: .add)
        self.navigationItem.setRightBarButton(addButton, animated: false)

        self.view.backgroundColor = .white

        self.view.addSubview(backgroundImageView)

        self.backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
