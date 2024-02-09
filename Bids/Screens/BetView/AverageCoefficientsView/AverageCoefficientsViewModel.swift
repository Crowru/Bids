//  AverageCoefficientsViewModel.swift
//  Bids
//  Created by Руслан  on 09.02.2024.

import Foundation

final class AverageCoefficientsViewModel: ObservableObject {
    @Published var coefficients: Coefficients
    
    let maxCoefficientValue: Double = 3.0
    let totalWidth: CGFloat
    
    init(coefficients: Coefficients, screenWidth: CGFloat) {
        self.coefficients = coefficients
        self.totalWidth = screenWidth * 0.55
    }
    
    func validatedCoefficient(_ coefficient: Double) -> Double {
        return max(0, min(coefficient, maxCoefficientValue))
    }
    
    func coefficientWidth(_ coefficient: Double) -> CGFloat {
        return CGFloat(validatedCoefficient(coefficient) / maxCoefficientValue) * totalWidth
    }
}
