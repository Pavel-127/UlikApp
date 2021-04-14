//
//  UACurrency.swift
//  Ulik
//
//  Created by macbook on 4/14/21.
//

import Foundation

enum UACurrency: String, CaseIterable {
    case USD = "Доллар США"
    case EUR = "Евро"
    case BYN = "Белорусский рубль"
    case RUB = "Российский рубль"

    static var stringCurrency: [String] {
        UACurrency.allCases.map { (currency) -> String in
            return currency.rawValue
        }
    }
}
