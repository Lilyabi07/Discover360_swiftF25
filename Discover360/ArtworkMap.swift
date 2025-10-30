//
//  ArtworkMap.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//
// Purpose: Shows a single artwork location on a map with a marker (iOS 17 Map API).

import SwiftUI
import MapKit


struct ArtworkMap: View {
    
    let artwork: Artwork
    
    @State private var region: MKCoordinateRegion
    init(artwork: Artwork) {
        self.artwork = artwork
        _region = State(initialValue: MKCoordinateRegion(
            center: artwork.location,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }
    var body: some View {
        Map(position: .constant(.region(region))) {
            Marker(artwork.name, coordinate: artwork.location)
        }
        .overlay(alignment: .top) {
            VStack(spacing: 4) {
                Text(artwork.name).font(.headline)
                Text(artwork.artist).font(.subheadline).foregroundStyle(.secondary)
            }
            .padding(.top, 10)
        }
        
    }
}
// MARK: - Preview
#Preview {
ArtworkMap(artwork: SampleData.artworks.first!)
.ignoresSafeArea()
}
