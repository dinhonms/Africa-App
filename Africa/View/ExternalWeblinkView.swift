//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Nonato Sousa on 13/10/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox{
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
    }
}
