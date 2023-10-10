//
//  AnimalDetailsView.swift
//  Africa
//
//  Created by Nonato Sousa on 10/10/23.
//

import SwiftUI

struct AnimalDetailsView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                
                //Hero image
                Image(animal.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                //Title
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                
                //Head line
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //Gallery
                
                //Facs
                
                //Description
                
                //Map
                
                //Link
                
            }
            .navigationBarTitle("Learn about \(animal.name)", displayMode:.inline)
        }
    }
}

struct AnimalDetailsView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailsView(animal: animals[1])
        }
    }
}
