//
//  UAUserDefaults.swift
//  Ulik
//
//  Created by macbook on 4/21/21.
//

import Foundation

class UAUserDefaults {
    static let sh = UAUserDefaults()

    private struct Keys {
        static let currency = "UACurrency"
    }

    var currency: UACurrency {
        get {
            self.loadCurrency()
        }
        set {
            self.saveCurrency(newValue)
        }
    }

    private init() {}

//    func saveCurrency() {
//        UserDefaults.standard.setValue(currency, forKey: "UACurrency")
//    }
//    func loadCurrency() -> String {
//        let value = UserDefaults.standard.value(forKey: "UACurrency") as? String
//        return value ?? "BYN"
//    }

    func saveCurrency(_ currency: UACurrency) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(currency) {
            UserDefaults.standard.setValue(data, forKey: Keys.currency)
        }
    }

    func loadCurrency() -> UACurrency {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: Keys.currency),
           let currency = try? decoder.decode(UACurrency.self, from: data) {
            return currency
        } else {
            return UACurrency.BYN
        }
    }
}
