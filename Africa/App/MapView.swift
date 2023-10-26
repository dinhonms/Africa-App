//
//  MapView.swift
//  Africa
//
//  Created by Nonato Sousa on 04/10/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var locations: [LocationModel] = Bundle.main.decode("locations.json")
    
    @State private var region: MKCoordinateRegion = {
        var coordinates = CLLocationCoordinate2D (latitude: 6.600286, longitude: 16.4377599)
        var zoomLevel = MKCoordinateSpan (latitudeDelta: 70.0, longitudeDelta: 70.0)
        var region = MKCoordinateRegion(center: coordinates, span: zoomLevel)
        
        return region
    }()
    
    var body: some View {
        //MARK: - BASIC MAP
//        Map(coordinateRegion: $region)
        
        //MARK: - ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //PIN: OLD STYLE (without interaction)
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            //MARKER: NEW STYLE (without interaction)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            //CUSTOM ANNOTATION (with interaction)
//            MapAnnotation(coordinate: item.location, anchorPoint: .zero) {
//                Image("logo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 32, height: 32)
//            }
            
            //CUSTOM ADVANCED ANNOTATION (with interaction)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
        .overlay(alignment: .top) {
            CoordinatesView(latitude: region.center.latitude, longitude: region.center.longitude)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
