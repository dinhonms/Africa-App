//
//  VideoListView.swift
//  Africa
//
//  Created by Nonato Sousa on 04/10/23.
//

import SwiftUI

struct VideoListView: View {
    var videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink (destination: VideoPlayerView(selectedVideo: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
