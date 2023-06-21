//
//  PopulateFeedData.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation
import SwiftUI

struct PopulateFeedData: View {

    let data: [FeedModel] = [
        .init(id: "0", name: "SteveJobs", imageName: "Book 2"),
        .init(id: "1", name: "Satya Nadella", imageName: "Book 3"),
        .init(id: "2", name: "Jeff Bezos", imageName: "Book 4"),
        .init(id: "3", name: "Tim Cook", imageName: "Book 5"),
        .init(id: "4", name: "SteveJobs", imageName: "book1"),
        .init(id: "5", name: "Satya Nadella", imageName: "bossmodel2"),
        .init(id: "6", name: "Jeff Bezos", imageName: "entre2"),
        .init(id: "7", name: "Tim Cook", imageName: "fitness2"),
        .init(id: "8", name: "SteveJobs", imageName: "Book 2"),
        .init(id: "9", name: "Satya Nadella", imageName: "Book 3"),
        .init(id: "10", name: "Jeff Bezos", imageName: "Book 4"),
        .init(id: "11", name: "Tim Cook", imageName: "Book 5")
    ]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(data) { items in
                FeedView(data: items)
            }
        }
        .padding(5)
        Spacer(minLength: 20)
    }
}
