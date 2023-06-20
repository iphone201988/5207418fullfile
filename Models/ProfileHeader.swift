//
//  ProfileHeader.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/16/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    var user: User?
    var isVerified: Bool
    var postCount: Int
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                if let user = user {
                    WebImage(url: URL(string: user.profileImageUrl)!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                        .padding(.leading)
                } else {
                    Color(red: 0.9, green: 0.9, blue: 0.9)
                        .frame(width: 120, height: 120)
                        .padding(.leading)
                }
                
                if let username = user?.username {
                    HStack {
                        Text(username)
                            .font(.headline)
                            .bold()
                            .padding(.leading, -4) // Add padding here to adjust the positioning of the username
                        if isVerified {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            
            Spacer() // Add a spacer to align the header content properly
            
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 8) {
                        Text("Posts")
                            .font(.footnote)
                        Text("\(postCount)")
                            .font(.headline)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("Followers")
                            .font(.footnote)
                        Text("\(followers)")
                            .font(.headline)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("Following")
                            .font(.footnote)
                        Text("\(following)")
                            .font(.headline)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.top, -35)
            }
        }
    }
}
