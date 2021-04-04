//
//  ViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAInitViewController: UIViewController {

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "splashImage")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(backgroundImageView)
    }
}
