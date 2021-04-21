//
//  UAAllCatigories.swift
//  Ulik
//
//  Created by macbook on 4/21/21.
//

import Foundation
import UIKit

class UAAllCatigories {

    static let sh = UAAllCatigories()

lazy var allCategorise: [UACategories] = [
    UACategories(image: UIImage(named: "produkt"),
                 title: NSLocalizedString("Categories products", comment: ""),
                 description: "25.68"),
    UACategories(image: UIImage(named: "JKH"),
                 title: NSLocalizedString("Categories communal payments", comment: "")),
    UACategories(image: UIImage(named: "auto"),
                 title: NSLocalizedString("Categories personal car", comment: ""),
                 description: "15.40"),
    UACategories(image: UIImage(named: "med"),
                 title: NSLocalizedString("Categories health", comment: "")),
    UACategories(image: UIImage(named: "publik transport"),
                 title: NSLocalizedString("Categories public transport", comment: "")),
    UACategories(image: UIImage(named: "beauty"),
                 title: NSLocalizedString("Categories beauty", comment: "")),
    UACategories(image: UIImage(named: "relax"),
                 title: NSLocalizedString("Categories relax", comment: "")),
    UACategories(image: UIImage(named: "costs"),
                 title: NSLocalizedString("Categories other expenses", comment: ""))
]

    private init() {}

}
