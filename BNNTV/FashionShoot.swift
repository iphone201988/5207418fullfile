//
//  FashionShoot.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct FashionShoot: View {
    var clips: [Clip] = ClipList.fashionShoot
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "C7C6C6")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    VideoPlayerView(url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/fasion-photo-shoot-pt2.mp4")!)
                    
                    Text("Latest Episodes")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .multilineTextAlignment(.center)
                    
                    List(clips, id: \.id) { clip in
                        NavigationLink(destination: ClipDetailView(clip: clip)) {
                            HStack {
                                Image(clip.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(4)
                                    .padding(.vertical, 4)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(clip.title)
                                        .fontWeight(.semibold)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.5)
                                    
                                    Text(clip.uploadDate)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .navigationBarTitle("Fashion Shoot", displayMode: .inline)
            }
        }
    }
}
