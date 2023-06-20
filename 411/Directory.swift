//
//  Directory.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI
import AVKit


struct Directory: View {
    @State var searchText = ""
    var brands: [Brand] = BrandList.brandcategories
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Image("411banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding(.top, -60)
                    
                    SearchBar(value: $searchText)
                        .padding(.horizontal)
                        .padding(.top, -48)
                    
                    Spacer()
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(brands, id: \.id) { brand in
                            NavigationLink(destination: {
                                if brand.fileLink == "MovieStudios" {
                                    MovieStudios()
                                } else {
                                    BrandDetailView(brand: brand)
                                }
                            }) {
                                BrandItemView(brand: brand)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .background(Color.gray)
            }
        }
    }
}


struct BrandItemView: View {
    var brand: Brand
    
    var body: some View {
        VStack(spacing: 8) {
            Image(brand.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .cornerRadius(8)
                .clipped()
        }
    }
}
