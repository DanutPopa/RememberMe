//
//  ContentView.swift
//  RememberMe
//
//  Created by Danut Popa on 13.11.2024.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $viewModel.pickerItem, matching: .all(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
        }
        .sheet(item: $viewModel.selectedFace) { namedFace in
            NamePhotoView(namedFace: namedFace) { newNamedFace in
                viewModel.addNamedFace(namedFace: newNamedFace)
            }
        }
        .onChange(of: viewModel.pickerItem) {
            Task {
                try await viewModel.loadImage()
            }
        }
    }
}

#Preview {
    ContentView()
}
