//
//  UAMainViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAMainViewController: UITableViewController {

    private var categories: [UACategories] = [
        UACategories(title: "Транспорт",
                     description: "0"),
        UACategories(title: "Отдых",
                     description: "0"),
        UACategories(title: "Продукты",
                     description: "0"),
        UACategories(title: "Разное",
                     description: "0"),
        UACategories(title: "ЖКХ",
                     description: "0")

    ]

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
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Главная"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.tableView.separatorStyle = .none

        let addButton = UIBarButtonItem(systemItem: .add)
        self.navigationItem.setRightBarButton(addButton,
                                              animated: false)

        self.tableView.register(UAMainCell.self,
                                forCellReuseIdentifier: UAMainCell.reuseIdentifier)

//                self.view.addSubview(backgroundImageView)
//
//                self.backgroundImageView.snp.makeConstraints { (make) in
//                    make.edges.equalToSuperview()
//                }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UAMainCell.reuseIdentifier, for: indexPath) as? UAMainCell ?? UAMainCell()

        cell.setCell(model: self.categories[indexPath.row])
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
