//
//  UAMainViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAMainViewController: UITableViewController {

    private let categories: [String] = [
    ]

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
        self.tableView.separatorStyle = .none

        let addButton = UIBarButtonItem(systemItem: .add)
        self.navigationItem.setRightBarButton(addButton,
                                              animated: false)

        self.tableView.register(UAMainCell.self,
                                forCellReuseIdentifier: UAMainCell.reuseIdentifier)

        self.view.backgroundColor = .white

//        self.view.addSubview(backgroundImageView)
//
//        self.backgroundImageView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UAMainCell.reuseIdentifier, for: indexPath)
//        cell.backgroundColor = .white

return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Введите сумму",
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

        
    }

}
