//
//  BnnTv.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI
import AVKit


struct BnnTv: View {
    var clips: [Clip] = ClipList.newShows
    @State private var selectedClip: Clip?
    
    var body: some View {
        ZStack {
            Color(hex: "C7C6C6")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                VideoPlayerView(url: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/05/bossvideo1.mov")!)
                
                Text("NOW PLAYING")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(clips) { clip in
                            ClipRow(clip: clip)
                                .onTapGesture {
                                    selectedClip = clip
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .sheet(item: $selectedClip) { clip in
            ClipDetailView(clip: clip)
        }
    }
}

struct ClipRow: View {
    var clip: Clip
    
    var body: some View {
        HStack {
            Image(clip.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(4)
            
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
        .padding(.vertical, 4)
        .padding(.horizontal, 10)
        .background(Color.white)
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
                

