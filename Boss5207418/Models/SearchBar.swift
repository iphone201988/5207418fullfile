//
//  SearchBar.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/14/23.
//


import SwiftUI

struct SearchBar: View {
    
    @Binding var value: String
    @State var isSearching = false
    

    var body: some View {
        
        
        HStack{
            TextField("Search here", text: $value)
            
                    .padding(.leading, 24)
            
            
        }.padding()
            .background(Color(.systemGray5))
            .cornerRadius(6.0)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
                    .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    Button( action: {value = ""} ){
                        Image(systemName: "xmark.circle.fill")
                        
                    }
                    
                    
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            )
        }
        
    }
