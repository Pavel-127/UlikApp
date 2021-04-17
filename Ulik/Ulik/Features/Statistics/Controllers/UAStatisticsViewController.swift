//
//  UAStatisticsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAStatisticsViewController: UITableViewController {

    let segmentArray = ["Сегодня", "Месяц"]

    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: segmentArray)

        return segment
    }()

//    internal lazy var tableView: UITableView = {
//        let tableView = UITableView()
//
//        return tableView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Статистика"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white

        self.view.addSubview(segmentControl)

        self.tableView.register(UAMainCell.self,
                                forCellReuseIdentifier: UAStatisticsCell.reuseIdentifier)

        self.segmentControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(30)
            make.width.equalTo(200)
            make.height.equalTo(35)
        }
    }
}
