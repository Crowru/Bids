//  BookmakerResultsView.swift
//  Bids
//  Created by Руслан  on 09.02.2024.

import SwiftUI

struct BookmakerResultsView: View {
    // MARK: Public Properties
    @ObservedObject var viewModel: BookmakerResultsViewModel
    
    // MARK: Lifecycle
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Выигрыши/проигрыши по букмекерам")
                .font(.headline)
                .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "tree")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 35, height: 35)
                    .offset(y: -10)
                Text("\(viewModel.allBetsCount) ставки")
                    .font(.headline)
            }
            
            HStack(spacing: 10) {
                ForEach(viewModel.data, id: \.count) {
                    Rectangle()
                        .fill($0.color)
                        .frame(maxWidth: viewModel.calculateWidth(for: $0.count)
                        )
                        .frame(height: 10)
                        .cornerRadius(10)
                }
            }
            
            HStack {
                ForEach(
                    viewModel.data.indices,
                    id: \.self
                ) { index in
                    let item = viewModel.data[index]
                    Text("\(item.count)(\(Int(viewModel.percentage(item.count).rounded()))%)")
                        .font(.subheadline)
                    Circle()
                        .fill(item.color)
                        .frame(width: 10, height: 10)
                    
                    if index != viewModel.data.indices.last {
                        Spacer()
                    }
                }
            }
            .offset(y: -15)
        }
        .padding(20)
        .background(Color.background)
        .cornerRadius(12)
    }
}

extension BookmakerResultsView {
    /// Initializes the view with pre-filled coefficients for preview purposes
    init() {
        self.viewModel = BookmakerResultsViewModel(
            results: BookmakerResults(
                winningsCount: 126,
                lossesCount: 106,
                refundCount: 70
            ),
            screenWidth: UIScreen.main.bounds.width
        )
    }
}

#Preview {
    BookmakerResultsView()
    .padding()
    .shadow(color: .shadow, radius: 5)
}
