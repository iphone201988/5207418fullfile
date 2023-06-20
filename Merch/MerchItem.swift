//
//  MerchItem.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

// MARK: Furniture Model And Sample Data
struct MerchItem: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var image: String
    var subTitle: String
    var price: String
    var buyURL: URL? // URL for purchasing the item
}

var merchitems: [MerchItem] = [
    MerchItem(title: "PhoneStand", image: "phonestand2", subTitle: "Watch our shows in style!", price: "$13.99", buyURL: URL(string: "https://example.com/buy/royal-palm-sofa")),
    MerchItem(title: "Modern Sofa", image: "shorts2", subTitle: "Arrive at the next function in style!", price: "$54.99", buyURL: URL(string: "https://example.com/buy/modern-sofa")),
    MerchItem(title: "Leather Sofa", image: "slides", subTitle: "Arrive at the next function in style!", price: "$37.50", buyURL: URL(string: "https://example.com/buy/leather-sofa")),
    MerchItem(title: "Luxury Sofa", image: "hoodie2", subTitle: "Arrive at the next function in style!", price: "$25.99", buyURL: URL(string: "https://example.com/buy/luxury-sofa")),
    MerchItem(title: "Seto Sofa", image: "bookbag", subTitle: "Arrive at the next function in style!", price: "$36.25", buyURL: URL(string: "https://example.com/buy/seto-sofa"))
]

