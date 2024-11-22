//
//  NamePhotoView.swift
//  RememberMe
//
//  Created by Danut Popa on 13.11.2024.
//

import SwiftUI

struct NamePhotoView: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (NamedFace) -> Void
    
    @State private var photoName = ""
    @State private var imageData: Data
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        VStack {
            Text("Name your photo")
                .font(.headline)
                .padding()
            
            TextField("Enter photo name", text: $photoName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            HStack {
                Button("Cancel") { dismiss() }
                    .padding()
                
                Spacer()
                
                Button("Save") {
                    if let currentLocation = locationFetcher.lastKnownLocation {
                        let location = Location(id: UUID(), latitude: currentLocation.latitude, longitude: currentLocation.longitude)
                        let newNamedLocationFace = NamedFace(id: UUID(), name: photoName, imageData: imageData, location: location)
                        onSave(newNamedLocationFace)
                    }
                    dismiss()
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 10)
        .padding()
    }
    
    init(namedFace: NamedFace, onSave: @escaping (NamedFace) -> Void) {
        self.onSave = onSave
        _imageData = State(initialValue: namedFace.imageData)
        locationFetcher.start()
    }
}

#Preview {
    NamePhotoView(namedFace: .example, onSave: { _ in })
}
