//
//  LocationModel.swift
//  Africa
//
//  Created by Nonato Sousa on 23/10/23.
//

import Foundation
import MapKit

struct LocationModel: Identifiable, Codable {
    var id, name, image: String
    var latitude, longitude: Double
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D (latitude: latitude, longitude: longitude)
    }
}
