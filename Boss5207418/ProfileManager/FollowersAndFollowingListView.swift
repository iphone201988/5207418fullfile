//
//  FollowersAndFollowingListView.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation
import SwiftUI

struct FollowersAndFollowingListView: View {

    var headerTitle: String
    
    var body: some View {
        List {
            ForEach(FollowersAndFollowingListModel.preparedListData(headerTitle)) { section in
                Section(section.name) {
                    ForEach(section.users) { productData in
                        UsersListView()
                    }
                }
            }
        }
    }
}

struct UsersListView: View {
    var body: some View {
        HStack {
            Image("Book 4")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            Text("Populate data in list goes 🥰😍")
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .foregroundStyle(LinearGradient(gradient: GradientColors.colors,
                                                startPoint: UnitPoint(x: 0, y: 0.5),
                                                endPoint: UnitPoint(x: 1.0, y: 0.5)))
        }
    }
}

struct GradientColors {
    static var colors: Gradient {
        let grColors = Gradient(colors:  [Color(red: 0.369, green: 0.553, blue: 0.839),
                                          Color(red: 0.302, green: 0.213, blue: 0.8),
                                          Color(red: 0.765, green: 0.263, blue: 0.537),
                                          Color(red: 0.859, green: 0.345, blue: 0.353)])
        return grColors
    }
}
