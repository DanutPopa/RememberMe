//
//  DetailView.swift
//  RememberMe
//
//  Created by Danut Popa on 19.11.2024.
//

import SwiftUI

struct DetailView: View {
    let namedFace: NamedFace
    
    var body: some View {
        NavigationStack {
            if let image = namedFace.image {
                image
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

#Preview {
    DetailView(namedFace: NamedFace.example)
}
