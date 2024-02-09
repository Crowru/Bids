//  BookmakerResults.swift
//  Bids
//  Created by Руслан on 09.02.2024.

import Foundation

struct BookmakerResults {
    let winningsCount: Int
    let lossesCount: Int
    let refundCount: Int
}

extension BookmakerResults {
    init() {
        self.winningsCount = Int()
        self.lossesCount = Int()
        self.refundCount = Int()
    }
}
