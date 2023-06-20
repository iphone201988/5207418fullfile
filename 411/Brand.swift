//
//  Brand.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct Brand: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let contactemail: String
    let website: String
    var url: URL?
    var fileLink: String?
}

struct BrandList {
    
    static let brandcategories = [
        Brand (imageName: "moviestudio2",
              title: "Fashion Shoot",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
              contactemail: "",
              website: "",
              fileLink: "MovieStudios"),
        
        Brand (imageName: "entre2",
              title: "Boss Model Inc",
              description: "In the first video of my Swift Beginner Series, you will build your first iOS App in Swift in 30 minutes in Xcode. Together, we will build a basic music player app that will play random songs from your iTunes library filtered by whatever genre you like.",
              contactemail: "",
              website: "",
              url: URL(string: "https://youtu.be/aiXvvL1wNUc")!),
        
        Brand (imageName: "fashion2",
              title: "Moving Out The Hood",
              description: "In the latest installment of my Swift Beginner Series, we'll discuss UITableView and custom UITableView Cells in Swift using Xcode. UITableViews are a fundamental part of iOS Development and knowing them well is invaluable. You will build these all the time in your iOS development career.",
              contactemail: "",
              website: "",
              url: URL(string: "https://youtu.be/FtO5QT2D_H8")!),
              
        Brand (imageName: "fitness2",
              title: "Boss Nation News",
              description: "The next topic in my series on iOS Interview questions explains the Delegate Protocol Communication Pattern in Swift. This is a fundamental question in iOS development and I was asked about it a lot during my interviews. In this tutorial I'll walk you through how the delegate protocol pattern in Swift works, using Xcode.",
              contactemail: "",
              website: "",
              url: URL(string: "https://youtu.be/DBWu6TnhLeY")!),
        
        Brand (imageName: "model2",
              title: "Vent Episodes",
              description: "I went from no programming experience to getting my first job as an iOS Developer in 7 months. In this video I explain specifically what I did to make that happen. I talk about the online courses I took as well as the developer bootcamp I attended. Many people wonder how to become an iOS Developer with no programming experience, if it's possible, and how long it takes.",
              contactemail: "",
              website: "",
              url: URL(string: "https://youtu.be/Y0qCWQDRWDw")!),
        
        Brand (imageName: "bossmodel2",
              title: "Vent Episodes",
              description: "I went from no programming experience to getting my first job as an iOS Developer in 7 months. In this video I explain specifically what I did to make that happen. I talk about the online courses I took as well as the developer bootcamp I attended. Many people wonder how to become an iOS Developer with no programming experience, if it's possible, and how long it takes.",
              contactemail: "",
              website: "",
              url: URL(string: "https://youtu.be/Y0qCWQDRWDw")!),
    ]
    
    
    static let moviestudios = [
        Brand (imageName: "screengreen",
              title: "Screen Green Studios",
              description: "List of services, hours, business description",
              contactemail: "",
              website: "www.sgstudiostv.com/",
              url: URL(string: "https://www.sgstudiostv.com/")!),
        
        Brand (imageName: "fashionshoot2",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
               contactemail: "",
               website: "",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/55797000-A8E8-4B2F-B83D-BAB536CE3243.mov")!),
        
        Brand (imageName: "fashionshoot3",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
               contactemail: "",
               website: "",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/74AA08EF-B896-4CA5-9019-FCF0E086587D-2.mov")!),
              
        Brand (imageName: "fashionshoot4",
              title: "Fashion Shoot-Behind The Scenes",
              description: "Step behind the camera and explore our exclusive playlist of behind-the-scenes clips from captivating photoshoots at our green screen studio.",
               contactemail: "",
               website: "",
              url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/0FFC839B-F081-49CB-AA69-6DD97B3A6296.mov")!),
        
    ]
}

