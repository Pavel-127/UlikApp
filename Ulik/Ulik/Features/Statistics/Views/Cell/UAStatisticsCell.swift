//
//  UAStatisticsCell.swift
//  Ulik
//
//  Created by macbook on 4/17/21.
//

import UIKit

class UAStatisticsCell: UITableViewCell {

    static let reuseIdentifier: String = "UAStatisticsCell"

    //MARK: - gui variables

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale

        return view
    }()

    private lazy var mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    private lazy var imageName: UILabel = {
        let name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.translatesAutoresizingMaskIntoConstraints = false

        return name
    }()

    private lazy var summLabel: UILabel = {
        let summ = UILabel()
        summ.font = UIFont.boldSystemFont(ofSize: 20)
        summ.translatesAutoresizingMaskIntoConstraints = false

        return summ
    }()

    //MARK: - view life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.mainImageView)
        self.containerView.addSubview(self.imageName)
        self.containerView.addSubview(self.summLabel)

    }

    //MARK: - constraints
    
    override func updateConstraints() {
        self.containerView.snp.updateConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
            make.height.equalTo(90)
        }

        self.mainImageView.snp.updateConstraints { (make) in
            make.width.equalTo(55)
            make.height.equalTo(45)
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(20)
            make.bottom.equalTo(self.imageName.snp.top).inset(5)
        }

        self.imageName.snp.updateConstraints { (make) in
            make.top.equalTo(self.mainImageView.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(20)
            make.right.bottom.equalToSuperview().inset(10)
        }

        self.summLabel.snp.updateConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(15)
            make.left.equalTo(self.mainImageView.snp.right).offset(210)
            make.right.equalToSuperview().inset(20)
        }

        super.updateConstraints()
    }

    func setCell(model: UACategories) {
        self.imageName.text = model.title
        self.summLabel.text = model.description
        self.mainImageView.image = model.image

        self.setNeedsUpdateConstraints()
    }
}
