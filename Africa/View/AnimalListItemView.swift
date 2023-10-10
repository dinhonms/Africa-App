//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Nonato Sousa on 10/10/23.
//

import SwiftUI

struct AnimalListItemView: View {
    var animal: AnimalModel
    
    var body: some View {
        HStack (alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 12) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animal: animals[1])
    }
}
