//  AverageCoefficientsWireframe.swift
//  Bids
//  Created by Руслан on 09.02.2024.

import SwiftUI

final class AverageCoefficientsWireframe {
    static func builder() -> AnyView {
        let coefficients = Coefficients(
            winningsCoefficient: 2.95942,
            lossesCoefficient: 2.1234,
            refundCoefficient: 1.3333333333
        )
        let averageCoefficientsViewModel = AverageCoefficientsViewModel(
            coefficients: coefficients, 
            screenWidth: UIScreen.main.bounds.width
        )
        let averageCoefficientsView = AverageCoefficientsView(viewModel: averageCoefficientsViewModel)
        return AnyView(averageCoefficientsView)
    }
}
