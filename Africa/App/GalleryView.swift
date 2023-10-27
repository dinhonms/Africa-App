//
//  GalleryView.swift
//  Africa
//
//  Created by Nonato Sousa on 04/10/23.
//

import SwiftUI

struct GalleryView: View {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State var selectedImage: String = "lion"
    
    //Simple definition
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    //better definition for the above option
    //    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic grid
    @State var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State var gridColumn: Double = 3.0
    @State var selectedGridButton = "square.grid.4x3.fill"
    @State var gridButtons = [
        "square.grid.4x3.fill",
        "square.grid.2x2.fill",
        "square.grid.3x2.fill"
    ]
    
    @State var gridButtonIndex: Int = 0
    
    func changeGridButton() -> String {
        gridButtonIndex += 1
        
        if gridButtonIndex > gridButtons.count - 1 {
            gridButtonIndex = 0
        }
        
        selectedGridButton = gridButtons[gridButtonIndex]
        
        changeGridLayout()
        
        return selectedGridButton
    }
    
    func changeGridLayout() {
        gridColumn += 1
        
        if gridColumn > 4 {
            gridColumn = 2
        }
        
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    func initializeGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 30){
                Image(selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(lineWidth: 6)
                    }
                
                HStack {
                    Spacer()
                    Button {
                        changeGridButton()
                        haptics.impactOccurred()
                    } label: {
                        Image(systemName: selectedGridButton)
                            .font(.system(size: 30))
                    }
                }
                .padding(.horizontal, 30)
                
                //                Slider(value: $gridColumn, in: 2...4, step: 1.0)
                //                    .padding(.horizontal)
                //                    .onChange(of: gridColumn) { newValue in
                //                        changeGridLayout()
                //                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay(alignment: .center) {
                                Circle()
                                    .stroke(lineWidth: 2)
                            }
                            .onTapGesture {
                                selectedImage = animal.image
                                haptics.impactOccurred()
                            }
                        
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    initializeGridLayout()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
