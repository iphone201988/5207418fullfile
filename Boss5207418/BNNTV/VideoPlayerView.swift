//
//  VideoPlayerView.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var url: URL

    var body: some View {
        VideoPlayer(player: AVPlayer(url: url))
            .frame(height: 200)
    }
}
