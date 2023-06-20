//
//  Merch.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct Merch: View {
    @State private var animation = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                Image("shopbanner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Boss Nation Merch")
                        .font(.title.bold())
                    
                    Text("Support The Movement")
                        .font(.callout)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 12) {
                    HStack(spacing: 12) {
                        Image("Search")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        TextField("Search", text: .constant(""))
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                    }
                    
                    Button(action: {
                        // Action for filter button
                    }) {
                        Image("Filter")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.pink)
                            .frame(width: 25, height: 25)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.white)
                            }
                    }
                }
                
                CustomMenu()
                
                ForEach(merchitems) { merchitem in
                    NavigationLink(destination: MerchDetailView(merchitem: merchitem, animation: Namespace().wrappedValue)) {
                        CardView(merchitem: merchitem, animation: self.animation)
                    }
                }
            }
            .padding()
            .padding(.bottom, 100)
        }
        .background(Color.gray)
    }
    
    @ViewBuilder
    func CardView(merchitem: MerchItem, animation: Bool) -> some View {
        HStack(spacing: 12) {
            Group {
                if animation {
                    Image(merchitem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                } else {
                    Image(merchitem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(width: 120)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.gray)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    if animation {
                        Text(merchitem.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .opacity(0)
                        
                    } else {
                        Text(merchitem.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        
    
                    }
                }
                
                Text(merchitem.subTitle)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black.opacity(0.8))
                
                HStack {
                    Text(merchitem.price)
                        .font(.title3.bold())
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for buy button
                    }) {
                        Text("Buy")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .fill(Color.red)
                            )
                    }
                    .scaleEffect(0.9)
                }
                .offset(y: 10)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
        }
        .padding(.bottom, 6)
    }
    
    @ViewBuilder
    func CustomMenu() -> some View {
        HStack(spacing: 0) {
            ForEach(["Clothing", "Misc.", "Home", "Office", "Kids"], id: \.self) { menu in
                Text(menu)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        // Action for menu selection
                    }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
    }
}
