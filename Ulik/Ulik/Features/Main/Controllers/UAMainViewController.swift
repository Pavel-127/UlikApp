//
//  UAMainViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAMainViewController: UITableViewController {

    let addButton = UIBarButtonItem(systemItem: .add)

    private var categories: [UACategories] = [
        UACategories(image: UIImage(named: "produkt"),
                     title: "Продукты",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "JKH"),
                     title: "Коммунальные платежи",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "auto"),
                     title: "Личный авто",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "med"),
                     title: "Здоровье",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "publik transport"),
                     title: "Общественный транспорт",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "beauty"),
                     title: "Красота",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "relax"),
                     title: "Отдых",
                     description: "111.1",
                     amount: 0.0),
        UACategories(image: UIImage(named: "costs"),
                     title: "Иные расходы",
                     description: "111.1",
                     amount: 0.0)
]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Главная"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.tableView.separatorStyle = .none

        self.navigationItem.setRightBarButton(addButton,
                                              animated: false)

        self.tableView.register(UAMainCell.self,
                                forCellReuseIdentifier: UAMainCell.reuseIdentifier)

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

        let alertController = UIAlertController(title: "Введите сумму", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
            if let summTextField = alertController.textFields?[0] {
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }

        alertController.addTextField { (textField) in
            textField.placeholder = "сумма"
        }

        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)

        present(alertController, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case.delete:
            self.categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case.insert:
            print("insert")
        default:
            break
        }
    }
}
