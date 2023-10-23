//
//  VideoModel.swift
//  Africa
//
//  Created by Nonato Sousa on 17/10/23.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    let id, name, headline: String
        
    var thumbName: String {
        return "video-\(id)"
    }
    
}
