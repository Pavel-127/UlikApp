//
//  UAStatisticsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAStatisticsViewController: UIViewController {

    //MARK: - models

    lazy var statisticCategories: [UACategories] = UAAllCatigories.sh.allCategorise

    //MARK: - gui varibles

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UAStatisticsCell.self, forCellReuseIdentifier: UAStatisticsCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second title".localized
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)

        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        UAAllCatigories.sh.allCategorise = UAAllCatigories.sh.allCategorise.filter { $0.description != "0.00" }
    }
}

//MARK: - extensions

extension UAStatisticsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UAAllCatigories.sh.allCategorise.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UAStatisticsCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? UAStatisticsCell {
            cell.setCell(model: UAAllCatigories.sh.allCategorise[indexPath.row])
        }
        cell.selectionStyle = .none
        return cell
    }
}
