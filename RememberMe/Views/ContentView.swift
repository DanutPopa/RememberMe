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
        NavigationStack {
            List(viewModel.namedFaces.sorted()) { namedFace in
                NavigationLink {
                    DetailView()
                } label: {
                    VStack {
                        Text(namedFace.name)
                            .font(.headline)
                        
                        if let image = namedFace.image {
                            image
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding(.horizontal)
                }

            }
            .navigationTitle("NamedFace")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    PhotosPicker(selection: $viewModel.pickerItem, matching: .images) {
                        Label("Select a photo", systemImage: "photo")
                    }
                }
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
