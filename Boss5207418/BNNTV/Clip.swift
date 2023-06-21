//
//  Clip.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct Clip: Identifiable, Equatable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let viewCount: Int
    let uploadDate: String
    var url: URL?
    var fileLink: String?
}

struct ClipList {
    
    static let newShows = [
        Clip (imageName: "fashionshoot",
              title: "Fashion Shoot",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
              viewCount: 370222,
              uploadDate: "February 17, 2019",
              fileLink: "FashionShoot"),
        
        Clip (imageName: "bossmodelsinc",
              title: "Boss Model Inc",
              description: "In the first video of my Swift Beginner Series, you will build your first iOS App in Swift in 30 minutes in Xcode. Together, we will build a basic music player app that will play random songs from your iTunes library filtered by whatever genre you like.",
              viewCount: 239150,
              uploadDate: "May 6, 2017",
              url: URL(string: "https://youtu.be/aiXvvL1wNUc")!),
        
        Clip (imageName: "moving",
              title: "Moving Out The Hood",
              description: "In the latest installment of my Swift Beginner Series, we'll discuss UITableView and custom UITableView Cells in Swift using Xcode. UITableViews are a fundamental part of iOS Development and knowing them well is invaluable. You will build these all the time in your iOS development career.",
              viewCount: 162897,
              uploadDate: "May 19, 2017",
              url: URL(string: "https://youtu.be/FtO5QT2D_H8")!),
              
        Clip (imageName: "news",
              title: "Boss Nation News",
              description: "The next topic in my series on iOS Interview questions explains the Delegate Protocol Communication Pattern in Swift. This is a fundamental question in iOS development and I was asked about it a lot during my interviews. In this tutorial I'll walk you through how the delegate protocol pattern in Swift works, using Xcode.",
              viewCount: 119115,
              uploadDate: "May 21, 2017",
              url: URL(string: "https://youtu.be/DBWu6TnhLeY")!),
        
        Clip (imageName: "ventepisodes",
              title: "Vent Episodes",
              description: "I went from no programming experience to getting my first job as an iOS Developer in 7 months. In this video I explain specifically what I did to make that happen. I talk about the online courses I took as well as the developer bootcamp I attended. Many people wonder how to become an iOS Developer with no programming experience, if it's possible, and how long it takes.",
              viewCount: 112213,
              uploadDate: "July 7, 2017",
              url: URL(string: "https://youtu.be/Y0qCWQDRWDw")!),
    ]
    
    
    static let fashionShoot = [
        Clip (imageName: "fashionshoot1",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
              viewCount: 370222,
              uploadDate: "February 17, 2019",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/C27DEB9E-8AF4-4958-A69A-9646F3546EFE.mov")!),
        
        Clip (imageName: "fashionshoot2",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
              viewCount: 239150,
              uploadDate: "May 6, 2017",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/55797000-A8E8-4B2F-B83D-BAB536CE3243.mov")!),
        
        Clip (imageName: "fashionshoot3",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
              viewCount: 162897,
              uploadDate: "May 19, 2017",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/74AA08EF-B896-4CA5-9019-FCF0E086587D-2.mov")!),
              
        Clip (imageName: "fashionshoot4",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
              viewCount: 119115,
              uploadDate: "May 21, 2017",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/0FFC839B-F081-49CB-AA69-6DD97B3A6296.mov")!),
        
    ]
}
