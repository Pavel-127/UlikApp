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
                     description: 25.68),
        UACategories(image: UIImage(named: "JKH"),
                     title: "Коммунальные платежи"),
        UACategories(image: UIImage(named: "auto"),
                     title: "Личный авто",
                     description: 15.40),
        UACategories(image: UIImage(named: "med"),
                     title: "Здоровье"),
        UACategories(image: UIImage(named: "publik transport"),
                     title: "Общественный транспорт"),
        UACategories(image: UIImage(named: "beauty"),
                     title: "Красота"),
        UACategories(image: UIImage(named: "relax"),
                     title: "Отдых"),
        UACategories(image: UIImage(named: "costs"),
                     title: "Иные расходы")
    ]{
        didSet {
            self.filtredCategories = self.categories
        }
    }

    private lazy var filtredCategories: [UACategories] = self.categories

    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.hidesNavigationBarDuringPresentation = false
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Поиск"

        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Главная"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchController.searchResultsUpdater = self
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false

        self.tableView.separatorStyle = .none

        self.navigationItem.setRightBarButton(addButton,
                                              animated: false)

        self.tableView.register(UAMainCell.self,
                                forCellReuseIdentifier: UAMainCell.reuseIdentifier)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filtredCategories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UAMainCell.reuseIdentifier, for: indexPath) as? UAMainCell ?? UAMainCell()

        cell.setCell(model: self.filtredCategories[indexPath.row])
        cell.selectionStyle = .none

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let alertController = UIAlertController(title: "Введите сумму", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
            if let summTextField = alertController.textFields?[0] {
                self.filtredCategories[indexPath.row].description += Double(summTextField.text!)!
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "0.00"
            textField.keyboardType = UIKeyboardType.decimalPad
        }

        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.tableView.reloadData()

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
        tableView.reloadData()
    }
}

extension UAMainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        if searchText.isEmpty {
            self.filtredCategories = self.categories
        } else {
            self.filtredCategories = self.categories.filter{ $0.title.lowercased().contains(searchText.lowercased()) }
        }
        self.tableView.reloadData()
    }
}
