//  AverageCoefficientsView.swift
//  Bids
//  Created by Руслан  on 09.02.2024.

import SwiftUI

struct AverageCoefficientsView: View {
    // MARK: Public Properties
    @ObservedObject var viewModel: AverageCoefficientsViewModel
    
    // MARK: Lifecycle
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Средние коэффициенты")
                .font(.headline)
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 8) {
                coefficientRow(color: .green, coefficient: viewModel.coefficients.winningsCoefficient, label: "Выигрыш")
                coefficientRow(color: .red, coefficient: viewModel.coefficients.lossesCoefficient, label: "Проигрыш")
                coefficientRow(color: .gray, coefficient: viewModel.coefficients.refundCoefficient, label: "Возврат")
            }
        }
        .padding()
        .frame(width: .infinity)
        .background(Color.background)
        .cornerRadius(12)
    }
    
    private func coefficientRow(color: Color, coefficient: Double, label: String) -> some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: viewModel.totalWidth, height: 10)
                Rectangle()
                    .fill(color)
                    .frame(width: viewModel.coefficientWidth(coefficient), height: 10)
            }
            .cornerRadius(10)
            
            Text(label)
                .foregroundColor(.gray)
                .font(.subheadline)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            
            Spacer()
            
            Text(String(format: "%.2f", viewModel.validatedCoefficient(coefficient)))
                .font(.subheadline.bold())
        }
    }
}


extension AverageCoefficientsView {
    /// Initializes the view with pre-filled coefficients for preview purposes
    init() {
        self.viewModel = AverageCoefficientsViewModel(
            coefficients: Coefficients(
                winningsCoefficient: 2.95942,
                lossesCoefficient: 2.1234,
                refundCoefficient: 1.3333333333
            ), 
            screenWidth: UIScreen.main.bounds.width
        )
    }
}

#Preview {
    AverageCoefficientsView()
    .padding()
    .shadow(radius: 5)
}
