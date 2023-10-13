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
            VStack(spacing: 20) {
                
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
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingTitle: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Facs
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingTitle: "Did you know?")
                    InsetFacstView(animal: animal)
                }
                .padding(.horizontal)
                
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingTitle: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //Map
                Group{
                    HeadingView(headingImage: "map", headingTitle: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingTitle: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
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
