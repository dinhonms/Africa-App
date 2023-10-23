//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Nonato Sousa on 20/10/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var selectedVideo: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(videoName: selectedVideo, fileExtension: ".mp4"))
                .overlay (
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 32)
                        .padding(EdgeInsets(top: 11, leading: 8, bottom: 0, trailing: 0))
                    ,alignment: .topLeading
                )
        }
        .frame(width: .infinity, height: 250)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.accentColor)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(selectedVideo: "lion", videoTitle: "Lion")
        }
    }
}
