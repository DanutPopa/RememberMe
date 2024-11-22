//
//  DetailView.swift
//  RememberMe
//
//  Created by Danut Popa on 19.11.2024.
//

import MapKit
import SwiftUI

struct PhotoDetailView: View {
    let namedFace: NamedFace
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = namedFace.image {
                    image
                        .resizable()
                        .scaledToFit()
                }
                Map {
                    Marker(namedFace.name, coordinate: namedFace.location.coordinate)
                }
                .mapStyle(.hybrid(elevation: .realistic))
            }
        }
    }
}

#Preview {
    PhotoDetailView(namedFace: NamedFace.example)
}
