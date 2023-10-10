//
//  HeadingView.swift
//  Africa
//
//  Created by Nonato Sousa on 10/10/23.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingTitle)
                .font(.title3)
                .fontWeight(.heavy)
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingTitle: "Wilderness in Pictures")
    }
}
