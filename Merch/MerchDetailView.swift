//
//  MerchDetailView.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct MerchDetailView: View {
    var merchitem: MerchItem
    var animation: Namespace.ID
    
    @State private var showDetailContent = false
    @State private var activeColor = "Color1"
    @State private var cartCount = 0
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            VStack {
                HStack {
                    Button {
                        withAnimation(.easeInOut) {
                            showDetailContent = false
                        }
                        withAnimation(.easeInOut.delay(0.05)) {
                            // appModel.showMerchDetailView = false
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.white)
                            )
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(Color.red)
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.white)
                            )
                    }
                }
                .padding()
                .opacity(showDetailContent ? 1 : 0)
                
                Image(merchitem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: merchitem.id + "IMAGE", in: animation)
                    .frame(height: size.height / 3)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(merchitem.title)
                                .font(.title.bold())
                                .foregroundColor(.black)
                                .fixedSize()
                                .matchedGeometryEffect(id: merchitem.id + "TITLE", in: animation)
                                .lineLimit(1)
                            
                            Text("by Seto")
                                .font(.caption2)
                                .bold()
                                .foregroundColor(.gray)
                                .fixedSize()
                                .matchedGeometryEffect(id: merchitem.id + "SUBTITLE", in: animation)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Label {
                            Text("4.7")
                                .font(.callout)
                                .fontWeight(.bold)
                        } icon: {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background {
                            Capsule()
                                .strokeBorder(.black.opacity(0.2), lineWidth: 1)
                        }
                        .scaleEffect(0.8)
                    }
                    
                    Text("Crafted with a perfect construction by Seto Febriant and have a balancing ergonomic for humans body, top quality leather in the back of the rest.")
                        .font(.callout)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                    
                    HStack(spacing: 10) {
                        Text("Color")
                            .font(.callout.bold())
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                        
                        ForEach(["Color1", "Color2", "Color3"], id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .background {
                                    Circle()
                                        .strokeBorder(.black)
                                            .padding(-4)
                                            .opacity(activeColor == color ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        activeColor = color
                                    }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Image(systemName: "minus")
                                    .onTapGesture {
                                        if cartCount > 0 {
                                            cartCount -= 1
                                        }
                                    }
                                
                                Text("\(cartCount)")
                                
                                Image(systemName: "plus")
                                    .onTapGesture {
                                        cartCount += 1
                                    }
                            }
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background {
                                Capsule()
                                    .fill(.black.opacity(0.1))
                            }
                        }
                        
                        Spacer(minLength: 5)
                        
                        Rectangle()
                        .fill(.black.opacity(0.1))
                            .frame(height: 1)
                        
                        HStack {
                            Text(merchitem.price)
                                .font(.largeTitle.bold())
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                if let buyURL = merchitem.buyURL {
                                    if UIApplication.shared.canOpenURL(buyURL) {
                                        UIApplication.shared.open(buyURL)
                                    }
                                }
                            }) {
                                Text("Buy Now")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .padding(.horizontal, 30)
                                    .background(
                                        Capsule()
                                            .fill(.red)
                                    )
                            }
                        }
                        .padding(.bottom, 5)
                    }
                    .padding(.top, 35)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.white)
                            .ignoresSafeArea()
                    }
                    .opacity(showDetailContent ? 1 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .background {
                Color("BG")
                    .opacity(showDetailContent ? 1 : 0)
                    .ignoresSafeArea()
            }
            .onAppear {
                withAnimation(.easeInOut) {
                    showDetailContent = true
                }
            }
        }
    }
