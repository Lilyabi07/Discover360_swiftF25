//
//  ContentView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//
// Purpose: Final screen (Explorer Dashboard) showing entry tiles in a grid.

import SwiftUI

struct ContentView: View {
   private let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
                ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                // MARK: Panorama Tour
                NavigationLink {
                PanoramaGridView(imageNames: SampleData.panoramaImageNames)
                } label: {
                    ModuleCard(title: "Panorama Tour",
                               subtitle: "Grid + full-screen",
                               systemImage: "photo.on.rectangle.angled")
                }
                // MARK: Artworks
                NavigationLink {
                ArtworkGridView(artworks: SampleData.artworks)
                } label: {
                ModuleCard(title: "Artworks",
                subtitle: "Grid + Map",
                systemImage: "paintbrush.fill")
                }
                // MARK: Sanctuaries
                NavigationLink {
                    SanctuaryMapView()
                } label: {
                ModuleCard(title: "Sanctuaries",
                subtitle: "Interactive Map",
                systemImage: "leaf.fill")
                }
                // MARK: Original Scroll Tour
                NavigationLink {
                TourScrollView(imageNames: SampleData.panoramaImageNames)
                } label: {
                ModuleCard(title: "Tour (Scroll)",
                subtitle: "Vertical gallery",
                systemImage: "scroll")
                }
                }
                .padding(16)
                }
                .navigationTitle("Explorer Dashboard")
                }
                }
                }
               
                // MARK: - Module Card
                /// Simple glassy card used on the dashboard.
                struct ModuleCard: View {
                let title: String
                let subtitle: String
                let systemImage: String
                var body: some View {
                VStack(spacing: 12) {
                Image(systemName: systemImage)
                .font(.system(size: 40, weight: .semibold))
                .frame(height: 60)
                Text(title).font(.headline)
                Text(subtitle).font(.subheadline).foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, minHeight: 140)
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 2, y: 1)
                }
                }
 // MARK: - Preview
    #Preview {
        ContentView()
    }
