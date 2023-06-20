//
//  MovieStudios.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/14/23.
//


import SwiftUI



struct MovieStudios: View {
    @State var searchText = ""
    var brands: [Brand] = BrandList.moviestudios

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Image("moviestudio")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding(.top, -100)
                    
                    SearchBar(value: $searchText)
                        .padding(.horizontal)
                        .padding(.top, -50)
                    
                    LazyVStack(spacing: 16) {
                        ForEach(brands, id: \.id) { brand in
                            NavigationLink(destination: {
                                if brand.fileLink == "MovieStudios" {
                                    MovieStudios()
                                } else {
                                    BrandDetailView(brand: brand)
                                }
                            }) {
                                HStack {
                                    Image(brand.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .cornerRadius(4)
                                        .padding(.vertical, 4)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(brand.title)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.5)
                                        
                                        Text(brand.website)
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
            .background(Color.black)
        }
    }
}
