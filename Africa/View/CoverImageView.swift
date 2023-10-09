//
//  CoverImageView.swift
//  Africa
//
//  Created by Nonato Sousa on 09/10/23.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(.page)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
