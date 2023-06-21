//
//  EarlierSnippets.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation

//Earlier Code: w.e.f 20.06.2023
/*
 //
 //  Profile.swift
 //  Boss5207418
 //
 //  Created by Rachelle Ford on 6/16/23.
 //

 import SwiftUI
 import SDWebImageSwiftUI
 import FirebaseAuth

 struct Profile: View {
 @EnvironmentObject var session: SessionStore
 @State private var isLinkActive = false

 @State private var postCount = 6
 @State private var following = 12
 @State private var followers = 12

 let data: [DataModel] = [
 .init(id: "0", name: "SteveJobs", imageName: "bannerbooks"),
 .init(id: "1", name: "Satya Nadella", imageName: "bannerbooks"),
 .init(id: "2", name: "Jeff Bezos", imageName: "bannerbooks"),
 .init(id: "3", name: "Tim Cook", imageName: "bannerbooks")
 ]

 var body: some View {
 GeometryReader { geoReader in
 NavigationView {
 ScrollView {
 VStack(spacing: 5) {
 ZStack(alignment: .topLeading) {
 Image("banner12")
 .resizable()
 .aspectRatio(contentMode: .fill)
 .frame(height: 200)
 .edgesIgnoringSafeArea(.top)
 .padding(.top)

 VStack {
 Spacer().frame(height: 125)
 HStack {
 Image("boss1")
 .resizable()
 .scaledToFit()
 .clipShape(Circle())
 .frame(width: 160, height: 160)
 .padding(.leading)

 VStack(alignment: .leading) {
 HStack {
 Text("Shiba Billionaire")
 .font(.system(size: 22))
 .bold()
 Image(systemName: "checkmark.circle.fill")
 .font(.system(size: 14))
 .foregroundColor(.blue)
 }
 }
 .padding(.leading, 10)
 .padding(.top, 80)
 .frame(maxWidth: .infinity, alignment: .leading)
 }
 }
 }
 .padding(.horizontal)

 HStack {
 Spacer()
 VStack(spacing: 8) {
 Text("Posts")
 .font(.footnote)
 Text("\(postCount)")
 .font(.headline)
 .bold()
 }

 VStack(spacing: 8) {
 Text("Followers")
 .font(.footnote)
 Text("\(followers)")
 .font(.headline)
 .bold()
 }

 VStack(spacing: 8) {
 Text("Following")
 .font(.footnote)
 Text("\(following)")
 .font(.headline)
 .bold()
 }

 Spacer()
 .frame(width: 52) // Move it 5 paces to the right and up
 }
 .padding(.top, -35)
 .frame(maxWidth: .infinity)
 .padding(.vertical)

 }

 VStack(alignment: .trailing) {
 Text("I was given a vision")
 .font(.headline)
 .lineLimit(2) // Change line limit to 2
 .padding(.trailing)
 }
 .padding(.top, -20) // Adjust padding to fit under the posts/followers/following items

 Text("BossNationApp.com")
 .font(.headline)
 .lineLimit(1)
 .padding(.trailing)

 HStack {
 Button(action: {
 // Follow action
 }) {
 VStack(alignment: .center) {
 Image(systemName: "person.badge.plus.fill")
 .font(.system(size: 24))
 .foregroundColor(.primary)
 }
 .frame(width: 40, height: 40)
 .background(Color.gray.opacity(0.2))
 .cornerRadius(10)
 .padding(.leading, 10)
 }
 .padding(.trailing)

 Spacer()

 NavigationLink(destination: EditProfile(session: self.session.session), isActive: $isLinkActive) {
 Button(action: { self.isLinkActive = true }) {
 VStack {
 Image(systemName: "pencil.circle.fill")
 .font(.system(size: 24))
 .foregroundColor(.primary)
 }
 .frame(width: 25, height: 25)
 .background(Color.gray.opacity(0.2))
 .cornerRadius(10)
 .padding(.trailing)
 }
 }

 Button(action: {
 // Log Out action
 }) {
 VStack {
 Image(systemName: "tray.full.fill")
 .font(.system(size: 24))
 .foregroundColor(.primary)
 }
 .frame(width: 25, height: 25)
 .background(Color.gray.opacity(0.2))
 .cornerRadius(10)
 .padding(.trailing, 10)
 }

 Button(action: {
 // Action for the button
 }) {
 VStack {
 Image(systemName: "envelope.fill")
 .font(.system(size: 24))
 .foregroundColor(.primary)
 }
 .frame(width: 25, height: 25)
 .background(Color.gray.opacity(0.2))
 .cornerRadius(10)
 .padding(.trailing, 10)
 }
 .padding(.top, 10)
 .padding(.horizontal)
 .background(Color(red: 0.8078, green: 0.8078, blue: 0.8078))
 }
 .padding(.horizontal)

 List {
 ForEach(data) { items in
 ForEach(0..<3) { item in
 CollectionView(data: items)
 }
 }
 }
 .frame(width: geoReader.size.width, height: 200)
 }
 }
 }
 }
 }

 struct DataModel: Identifiable {
 let id: String
 let name: String
 let imageName: String
 }

 struct CollectionView: View {
 let data: DataModel
 var body: some View {
 VStack {
 HStack {
 ForEach(0..<3) { items in
 Spacer()
 Image(self.data.imageName)
 .resizable()
 .frame(width: 100, height: 100)
 .clipShape(Circle())
 }
 }
 }
 }
 }

 */
