//
//  NamePhotoView.swift
//  RememberMe
//
//  Created by Danut Popa on 13.11.2024.
//

import SwiftUI

struct NamePhotoView: View {
    @Binding var photoName: String
    @Environment(\.dismiss) var dismiss
    
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
                    // Handle the save action, e.g, save the photo name
                    dismiss()
                    print("Photo named: \(photoName)")
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
}

#Preview {
    NamePhotoView(photoName: .constant(""))
}
