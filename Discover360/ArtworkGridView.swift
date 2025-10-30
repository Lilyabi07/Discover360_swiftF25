//
//  ArtworkGridView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
// Purpose: Artwork grid with a dedicated "Visited" toggle button per card.

import SwiftUI

struct ArtworkGridView: View

{
    // We keep a mutable copy so toggling visited updates the UI.
    @State private var artworks: [Artwork]
    private let columns = [GridItem(.adaptive(minimum: 170), spacing: 20)]
    @State private var selection: Artwork? = nil
    
    // Initialize state from the input list
    init(artworks: [Artwork]) {
    _artworks = State(initialValue: artworks)
    }
    var body: some View {
    ScrollView {
    LazyVGrid(columns: columns, spacing: 24) {
    ForEach(artworks.indices, id: \.self) { index in
        let art = artworks[index]
        VStack(alignment: .leading, spacing: 10) {
        ZStack(alignment: .topTrailing) {
        // Artwork image
        art.image
        .resizable()
        .scaledToFill()
        .frame(height: 140)
        .clipped()
        .cornerRadius(14)
        // Visited toggle button (top-right)
        Button {
        artworks[index].visited.toggle()
        } label: {
        Image(systemName: art.visited ? "checkmark.circle.fill" : "circle")
        .font(.title3)
        .padding(8)
        .background(.ultraThinMaterial, in: Circle())
        }
        .buttonStyle(.borderless) // Don’t steal the card tap
        .tint(art.visited ? .green : .secondary)
        .padding(8)
        }
        // Text content
        Text(art.name)
        .font(.headline)
        .lineLimit(1)
        Text(art.artist)
        .font(.caption)
        .foregroundStyle(.secondary)
        // Status row mirrors visited state
        HStack(spacing: 6) {
        Image(systemName: art.visited ? "checkmark.seal.fill" : "mappin.and.ellipse")
        Text(art.visited ? "Visited" : "View on Map")
        .font(.caption)
        }
        .foregroundStyle(art.visited ? .green : .blue)
        }
        .padding(14)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(radius: 2, y: 1)
        .contentShape(Rectangle()) // Whole card tappable for map
        .onTapGesture { selection = art } // Tap card → open map
        }
        }
        .padding(20)
        }
        .navigationTitle("Artworks")
        .sheet(item: $selection) { art in
        ArtworkMap(artwork: art)
        }
        }
        }
        // MARK: - Preview
#Preview {
    NavigationStack {
        ArtworkGridView(artworks: SampleData.artworks)
        
    }
}
