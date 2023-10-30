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
    @State var selectedGridButton = "square.grid.4x3.fill"
    @State var gridButtons = [
        "square.grid.4x3.fill",
        "square.grid.2x2.fill",
        "square.grid.3x2.fill"
    ]
    
    func changeGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 4 + 1)
        
        changeGridIcon(columnCount: gridLayout.count)
    }
    
    func changeGridIcon(columnCount: Int) {
        switch columnCount {
        case 1:
            selectedGridButton = "square.grid.2x2.fill"
        case 2:
            selectedGridButton = "square.grid.3x2.fill"
        case 3:
            selectedGridButton = "square.grid.4x3.fill"
        case 4:
            selectedGridButton = "rectangle.grid.1x2.fill"
        default:
            selectedGridButton = "square.grid.4x3.fill"
        }
    }
    
    func initializeGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: 3)
    }
    
    var body: some View {
        VStack (alignment: .center, spacing: 30) {
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
                    changeGridLayout()
                    haptics.impactOccurred()
                } label: {
                    Image(systemName: selectedGridButton)
                        .font(.system(size: 30))
                }
            }
            .padding(.horizontal, 30)
            
            ScrollView (.vertical, showsIndicators: false) {
                //Slider option
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
                .padding(.vertical)
                .animation(.easeIn)
                .onAppear {
                    initializeGridLayout()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
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
