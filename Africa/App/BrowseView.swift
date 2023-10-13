//
//  ContentView.swift
//  Africa
//
//  Created by Nonato Sousa on 04/10/23.
//

import SwiftUI

struct BrowseView: View {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    var body: some View {
        NavigationView{
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals){ animal in
                    NavigationLink(destination: AnimalDetailsView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }
                }
            }
            .navigationTitle("Africa")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
