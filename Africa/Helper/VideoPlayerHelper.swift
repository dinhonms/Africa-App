//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Nonato Sousa on 20/10/23.
//

import Foundation
import AVKit

var avPlayer: AVPlayer?

func playVideo(videoName: String, fileExtension: String) -> AVPlayer {
    
    if Bundle.main.url(forResource: videoName, withExtension: fileExtension) != nil {
        avPlayer = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: fileExtension)!)
        avPlayer?.play()
    }
    
    return avPlayer!
}
