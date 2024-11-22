//
//  Location.swift
//  RememberMe
//
//  Created by Danut Popa on 22.11.2024.
//

import MapKit
import SwiftUI

struct Location: Identifiable, Codable {
    var id: UUID
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


