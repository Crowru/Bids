//  BookmakerResultsWireframe.swift
//  Bids
//  Created by Руслан on 09.02.2024.

import SwiftUI

final class BookmakerResultsWireframe {
    static func builder() -> AnyView {
        let bookmakerResults = BookmakerResults(
            winningsCount: 126,
            lossesCount: 106,
            refundCount: 70
        )
        let bookmakerResultsViewModel = BookmakerResultsViewModel(results: bookmakerResults, screenWidth: UIScreen.main.bounds.width)
        let bookmakerResultsView = BookmakerResultsView(viewModel: bookmakerResultsViewModel)
        return AnyView(bookmakerResultsView)
    }
}
