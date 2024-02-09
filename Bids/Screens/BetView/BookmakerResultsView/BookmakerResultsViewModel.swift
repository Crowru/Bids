//  BookmakerResultsViewModel.swift
//  Bids
//  Created by Руслан  on 09.02.2024.

import SwiftUI

final class BookmakerResultsViewModel: ObservableObject {
    // MARK: Public Properties
    @Published var results: BookmakerResults
    
    let screenWidth: CGFloat
    
    var allBetsCount: Int {
        return results.winningsCount + results.lossesCount + results.refundCount
    }
    
    var data: [(color: Color, count: Int)] {
        return [
            (Color.green, results.winningsCount),
            (Color.red, results.lossesCount),
            (Color.gray, results.refundCount)
        ]
    }
    
    // MARK: Initialization
    init(results: BookmakerResults, screenWidth: CGFloat) {
        self.results = results
        self.screenWidth = screenWidth
    }
    
    func percentage(_ count: Int) -> Double {
        let total = Double(
            results.winningsCount +
            results.lossesCount +
            results.refundCount
        )
        return Double(count) / total * 100.0
    }
    
    func calculateWidth(for count: Int) -> CGFloat {
        let screenWidth = self.screenWidth
        let spacing = 20.0 / 3
        let barWidth = max(screenWidth * 0.9 * percentage(count) / 100 - spacing, 10)
        return barWidth
    }
}
