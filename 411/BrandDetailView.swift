//
//  BrandDetailView.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct BrandDetailView: View {
    @State private var isShowingAppPage = false
    var brand: Brand
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                
                Image(brand.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .cornerRadius(12)
                
                Text(brand.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 40) {
                    Label("\(brand.contactemail)", systemImage: "eye.fill")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(brand.website)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Text(brand.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                if let url = brand.url {
                    Button(action: {
                        UIApplication.shared.open(url)
                    }) {
                        Text("Watch Now")
                            .bold()
                            .font(.title2)
                            .frame(width: 200, height: 50)
                            .background(Color(.systemRed))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 80)
                } else if let fileLink = brand.fileLink {
                    Button(action: {
                        openAppPage(withName: fileLink)
                    }) {
                        Text("Watch Now")
                            .bold()
                            .font(.title2)
                            .frame(width: 200, height: 50)
                            .background(Color(.systemRed))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 80)
                    .sheet(isPresented: $isShowingAppPage) {
                        if fileLink == "FashionShoot" {
                            FashionShoot()
                        } else if fileLink == "Bnn Tv" {
                            BnnTv()
                        }
                        // Add more conditions for other app pages if needed
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: EmptyView(), trailing: EmptyView())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func openAppPage(withName name: String) {
        // Perform the logic to open the app page or URL link with the given name
        // Replace this with your actual implementation
        
        // Example implementation
        if let url = brand.url {
            // Open URL link
            UIApplication.shared.open(url)
        } else if let fileLink = brand.fileLink {
            if fileLink == "FashionShoot" {
                isShowingAppPage = true
            } else if fileLink == "Bnn Tv" {
                isShowingAppPage = true
            }
            // Add more conditions for other app pages if needed
        }
    }
}


