//
//  UAStatisticsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAStatisticsViewController: UIViewController {

//    let segmentArray = ["Сегодня", "Месяц"]

   lazy var statisticCategories: [UACategories] = UAAllCatigories.sh.allCategorise

    //MARK: - gui varibles

//    private lazy var segmentControl: UISegmentedControl = {
//        let segment = UISegmentedControl(items: segmentArray)
//
//        return segment
//    }()

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
//        self.view.addSubview(self.segmentControl)
//        tableView.register(UAStatisticsCell.self,
//                                forCellReuseIdentifier: UAStatisticsCell.reuseIdentifier)

        UAAllCatigories.sh.allCategorise = UAAllCatigories.sh.allCategorise.filter { $0.description != "0.00" }

//        self.segmentControl.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(80)
//            make.left.right.equalToSuperview().inset(100)
//            make.width.equalTo(200)
//            make.height.equalTo(35)
//        }
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.categories.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: UAStatisticsCell.reuseIdentifier, for: indexPath) as? UAStatisticsCell ?? UAStatisticsCell()
//
//        cell.setCell(model: self.categories[indexPath.row])
//        cell.selectionStyle = .none
//
//        return cell
//    }
}

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
