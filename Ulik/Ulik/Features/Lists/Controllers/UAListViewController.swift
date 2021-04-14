//
//  UAListViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAListViewController: UIViewController {

//    private lazy var backgroundImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "background")
//        imageView.contentMode = .scaleAspectFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.alpha = 0.5
//
//        return imageView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Списки"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.view.backgroundColor = .white
    }
}
