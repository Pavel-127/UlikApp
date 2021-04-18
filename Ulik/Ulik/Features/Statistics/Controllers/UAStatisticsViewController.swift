//
//  UAStatisticsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAStatisticsViewController: UITableViewController {

    let segmentArray = ["Сегодня", "Месяц"]

//    private lazy var categories: [UACategories]

    private var categories: [UACategories] = [UACategories(image: UIImage(named: "produkt"),
                                                           title: "Продукты",
                                                           description: "25.68"),
                                              UACategories(image: UIImage(named: "JKH"),
                                                           title: "Коммунальные платежи"),
                                              UACategories(image: UIImage(named: "auto"),
                                                           title: "Личный авто",
                                                           description: "15.40"),
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
    ]

    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: segmentArray)

        return segment
    }()

//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//
//
//        return tableView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Статистика"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white

//        self.tableView.addSubview(segmentControl)
        tableView.register(UAStatisticsCell.self,
                                forCellReuseIdentifier: UAStatisticsCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

        self.categories = self.categories.filter { $0.description != "0.00" }

//        self.segmentControl.snp.makeConstraints { (make) in
//            make.top.equalTo(self.tableView.snp.top).offset(10)
//            make.left.right.equalToSuperview().inset(100)
//            make.width.equalTo(200)
//            make.height.equalTo(35)
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UAStatisticsCell.reuseIdentifier, for: indexPath) as? UAStatisticsCell ?? UAStatisticsCell()

        cell.setCell(model: self.categories[indexPath.row])
        cell.selectionStyle = .none

        return cell
    }
}
