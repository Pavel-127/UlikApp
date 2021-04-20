//
//  toDouble+Ex.swift
//  Ulik
//
//  Created by macbook on 4/21/21.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")
        return numberFormatter.number(from: self)?.doubleValue
    }
}
