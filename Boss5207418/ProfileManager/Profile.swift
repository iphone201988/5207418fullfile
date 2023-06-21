//
//  Profile.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/16/23.
//

import SwiftUI

struct Profile: View {

    @State var feedType: FeedType = .usersPostInGridFormat
    @State var scrollPosition: Int? = 0

    var body: some View {
        GeometryReader { geoReader in
            NavigationStack {
                ScrollView {
                    VStack(spacing: 5) {
                        PopulateUserData()
                        ProfileActionsView(feedType: $feedType)
                        switch feedType {
                        case .usersPostInGridFormat:
                            PopulateFeedData()
                        case .usersSinglePostInScrollView:
                            Post()
                            Post(image: "profile2", caption: "Ready for Greater!")
                        case .usersVideoReelsInGridFormat:
                            PopulateFeedData()
                        }
                    }
                }
            }
        }
    }
}
