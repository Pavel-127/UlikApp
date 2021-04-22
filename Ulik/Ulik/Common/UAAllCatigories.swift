//
//  UAAllCatigories.swift
//  Ulik
//
//  Created by macbook on 4/21/21.
//

import UIKit

class UAAllCatigories {

    static let sh = UAAllCatigories()

    lazy var allCategorise: [UACategories] = [
        UACategories(image: UIImage(named: "produkt"),
                     title: "Categories products".localized,
                     description: "25.68"),
        UACategories(image: UIImage(named: "JKH"),
                     title: "Categories communal payments".localized),
        UACategories(image: UIImage(named: "auto"),
                     title: "Categories personal car".localized,
                     description: "15.40"),
        UACategories(image: UIImage(named: "med"),
                     title: "Categories health".localized),
        UACategories(image: UIImage(named: "publik transport"),
                     title: "Categories public transport".localized),
        UACategories(image: UIImage(named: "beauty"),
                     title: "Categories beauty".localized),
        UACategories(image: UIImage(named: "relax"),
                     title: "Categories relax".localized),
        UACategories(image: UIImage(named: "costs"),
                     title: "Categories other expenses".localized)
    ]

    private init() {}
    
}
