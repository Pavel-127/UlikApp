//
//  UAStatisticsViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit

class UAStatisticsViewController: UIViewController {

    let segmentArray = ["Сегодня", "Месяц"]

    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: segmentArray)

        return segment
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Статистика"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white

        self.view.addSubview(segmentControl)

        self.segmentControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(140)
            make.left.right.equalToSuperview().inset(60)
        }
    }
}
