//
//  CoordinatesView.swift
//  Africa
//
//  Created by Nonato Sousa on 24/10/23.
//

import SwiftUI

struct CoordinatesView: View {
    var latitude: CGFloat
    var longitude: CGFloat
    
    var body: some View {
        HStack (alignment: .center, spacing: 12) {
            Image("compass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48, alignment: .center)
                .padding(10)
            
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Latitude")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("\(latitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                }
                Divider()
                HStack {
                    Text("Logitude")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text("\(longitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                }
            }
        }
        .background(
            Color.black
                .opacity(0.8)
                .cornerRadius(8)
        )
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

struct CoordinatesView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatesView(latitude: 6.534343, longitude: 7.9989898)
    }
}
