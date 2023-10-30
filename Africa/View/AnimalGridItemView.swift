//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Nonato Sousa on 30/10/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    var animal: AnimalModel
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
    }
}
