//
//  PanoramaView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//

import SwiftUI
// MARK: - PanoramaView
struct PanoramaView: View {
let imageName: String
var body: some View {
Image(imageName)
.resizable()
.scaledToFit()
.cornerRadius(15)
.padding()
.transition(.opacity)
.animation(.easeIn(duration: 0.5), value: imageName)
}
}

// MARK: - Preview
#Preview {
PanoramaView(imageName: "central_park")
.padding()
.background(Color.black.opacity(0.05))
}

