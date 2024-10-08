//
//  Model.swift
//  TipLite
//
//  Created by Sümeyra Demirtaş on 10/7/24.
//

import Foundation

struct TipCalculator {
    var billAmount: Double
    var tipPercentage: Double
    var numberOfPeople: Int

    // Toplam bahşiş miktarı, ONEMLI: bunu kullanmayabilirim simdilik eklemedim ama ekleyebilirim
    func calculateTotalTip() -> Double {
        return billAmount * (tipPercentage / 100)
    }

    // Kişi başına düşen bahşiş miktarı
    func calculateTipPerPerson() -> Double {
        return calculateTotalTip() / Double(numberOfPeople)
    }

    // Kişi başına düşen fatura miktarı ( tip haric)
    func calculateBillPerPerson() -> Double {
        return billAmount / Double(numberOfPeople)
    }

    // Kişi başına düşen fatura + bahşiş miktarı (Total per person)
    func calculateTotalPerPerson() -> Double {
        return calculateBillPerPerson() + calculateTipPerPerson()
    }
}
