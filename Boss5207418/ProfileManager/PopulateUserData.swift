//
//  PopulateUserData.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation
import SwiftUI

struct PopulateUserData: View {

    @State private var postCount = 6
    @State private var following = 12
    @State private var followers = 12
    @State private var readyToNavigate : Bool = false
    @State private var readyToNavigateToFollowersList: Bool = false
    @State private var readyToNavigateToFollowingList: Bool = false
    @State private var readyToNavigateToUsersList: Bool = false
    @State private var shouldShowBooks = false
    @State private var shouldShowDirectory = false
    @State private var isVerifiedUser: Bool = true
    @State private var accountType: Int = AccountType.verifiedBusinessAccount.type
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var bannerImage: Image = Image("banner12")
    @State private var pickedImage: Image?
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @EnvironmentObject var session: SessionStore

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Banner pic
            bannerImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .edgesIgnoringSafeArea(.top)
                .padding(.top)
                .onTapGesture {
                    showingActionSheet = isVerifiedUser
                }

            HStack {
                // Profile pic
                Image("boss1")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 160, height: 160)

                VStack(spacing: 10) {
                    HStack {
                        // Name
                        Text("Shiba Billionaire")
                            .font(.system(size: 22))
                            .bold()
                        // Verified status icon
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 14))
                            .foregroundColor(AccountType.verifiedIcon(accountType))
                    }
                    .padding(.top, 110)
                    .frame(maxWidth: .infinity, alignment: .center)

                    HStack {
                        Button {
                            // Action for view posts
                        } label: {
                            VStack(spacing: 8) {
                                // Posts count
                                Text("Posts")
                                    .font(.footnote)
                                Text("\(postCount)")
                                    .font(.headline)
                                    .bold()
                            }
                        }

                        Button {
                            // Action for view followers user list
                            readyToNavigateToFollowersList = true
                        } label: {
                            VStack(spacing: 8) {
                                // Followers count
                                Text("Followers")
                                    .font(.footnote)
                                Text("\(followers)")
                                    .font(.headline)
                                    .bold()
                            }
                        }.navigationTitle("")
                            .navigationDestination(isPresented: $readyToNavigateToFollowersList) {
                                FollowersAndFollowingListView(headerTitle: "Followers")
                            }

                        Button {
                            // Action for view following user list
                            readyToNavigateToFollowingList = true
                        } label: {
                            VStack(spacing: 8) {
                                //Following count
                                Text("Following")
                                    .font(.footnote)
                                Text("\(following)")
                                    .font(.headline)
                                    .bold()
                            }
                        }
                        .navigationTitle("")
                        .navigationDestination(isPresented: $readyToNavigateToFollowingList) {
                            FollowersAndFollowingListView(headerTitle: "Following")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(.black))
                }
            }
            .padding(.leading, 10)
            .padding(.top, 125)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding([.leading, .trailing], 5)
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(
                title: Text(""),
                buttons: [
                    .default(Text("Choose A Photo")) {
                        self.sourceType = .photoLibrary
                        self.showingImagePicker = true
                    },
                    .default(Text("Take a Photo")) {
                        self.sourceType = .camera
                        self.showingImagePicker = true
                    },
                    .cancel()
                ]
            )
        }

        HStack {
            HStack(spacing: 10) {
                Button {
                    // Action for follow user
                    readyToNavigateToUsersList = true
                } label: {
                    VStack {
                        Image("followUser")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .navigationTitle("")
                .navigationDestination(isPresented: $readyToNavigateToUsersList) {
                    FollowersAndFollowingListView(headerTitle: "Users")
                }

                Button {
                    // Action for view directory
                    shouldShowDirectory = true
                } label: {
                    VStack {
                        Image("viewDirectory")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }

                Button {
                    // Action for book link
                    shouldShowBooks = true
                } label: {
                    VStack {
                        Image("bookLink")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .sheet(isPresented: $shouldShowDirectory) {
                Directory()
            }
            .sheet(isPresented: $shouldShowBooks) {
                BookHome()
            }

            Spacer()
            VStack(spacing: 5) {
                // User Bio
                Text("I was given a vision")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(2) // Change line limit to 2
                // User Website
                Text("BossNationApp.com")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
            }
            .frame(width: UIScreen.main.bounds.width - 180)
        }
        .frame(width: UIScreen.main.bounds.width - 10)
        .padding([.leading, .vertical], 10)
    }

    func loadImage() {
        guard let inputImage = pickedImage else { return }
        bannerImage = inputImage
    }
}
