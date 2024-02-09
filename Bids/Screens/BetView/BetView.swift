//  BetView.swift
//  Bids
//  Created by Руслан  on 09.02.2024.

import SwiftUI

struct BetView: View {
    // MARK: Lifecycle
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack(spacing: 20) {
                AverageCoefficientsWireframe.builder()
                BookmakerResultsWireframe.builder()
            }
            .padding()
            .shadow(color: .shadow, radius: 5)
        }
    }
}

#Preview {
    BetView()
}
