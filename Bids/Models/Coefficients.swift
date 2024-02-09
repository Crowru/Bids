//  Coefficients.swift
//  Bids
//  Created by Руслан on 09.02.2024.

import Foundation

struct Coefficients {
    var winningsCoefficient: Double
    var lossesCoefficient: Double
    var refundCoefficient: Double
}

extension Coefficients {
    init() {
        self.winningsCoefficient = Double()
        self.lossesCoefficient = Double()
        self.refundCoefficient = Double()
    }
}
