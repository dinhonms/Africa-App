//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Nonato Sousa on 12/10/23.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15){
                //MARK: - \.self It means to use the iterator object name as the id
                ForEach(animal.gallery, id: \.self){ imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[1])
    }
}
