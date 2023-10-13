//
//  InsetFacstView.swift
//  Africa
//
//  Created by Nonato Sousa on 12/10/23.
//

import SwiftUI

struct InsetFacstView: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self){ fact in
                    Text(fact)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFacstView_Previews: PreviewProvider {
    static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFacstView(animal: animals[1])
    }
}
