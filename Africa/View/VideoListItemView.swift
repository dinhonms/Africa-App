//
//  VideoListItem.swift
//  Africa
//
//  Created by Nonato Sousa on 17/10/23.
//

import SwiftUI

struct VideoListItemView: View {
    let video: VideoModel
    
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[0])
    }
}
