//
//  ProfileActionsView.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation
import SwiftUI

struct ProfileActionsView: View {

    @EnvironmentObject var session: SessionStore
    @State private var readyToNavigateEditProfile : Bool = false
    @State private var readyToNavigateToInbox: Bool = false
    @Binding var feedType: FeedType

    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                // Action for add user
            }) {
                VStack(alignment: .center) {
                    Image(systemName: "person.badge.plus.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            Spacer()

            Button {
                // Action for follow user
                readyToNavigateEditProfile = true
            } label: {
                VStack {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                .frame(width: 25, height: 25)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .navigationTitle("")
            .navigationDestination(isPresented: $readyToNavigateEditProfile) {
                EditProfile(session: self.session.session)
            }

            Button(action: {
                // Action for draft
            }) {
                VStack {
                    Image(systemName: "tray.full.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                .frame(width: 25, height: 25)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }

            Button(action: {
                // Action for message
                readyToNavigateToInbox = true
            }) {
                VStack {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                .frame(width: 25, height: 25)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .navigationTitle("")
                .navigationDestination(isPresented: $readyToNavigateToInbox) {
                    FollowersAndFollowingListView(headerTitle: "Inbox")
                }
        }
        .padding([.leading, .trailing], 15)

        HStack(spacing: 10) {
            Spacer()
            Button {
                // Action for view users post in grid format
                feedType = .usersPostInGridFormat
            } label: {
                VStack {
                    Image("feeds")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .frame(height: 50)
            
            Button {
                // Action for view users single post in scrollView
                feedType = .usersSinglePostInScrollView
            } label: {
                VStack {
                    Image("posts")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .frame(height: 50)

            Button {
                // Action for view users reels in grid format
                feedType = .usersVideoReelsInGridFormat
            } label: {
                VStack {
                    Image("reels")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .frame(height: 50)
        }
        .frame(height: 50)
        .padding(.trailing, 15)
    }
}
