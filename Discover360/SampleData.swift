//
//  SampleData.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//
import SwiftUI
import Foundation
// MARK: - Sample Data
enum SampleData {
static let panoramaImageNames: [String] = [
"central_park", "golden_gate", "grand_canyon",
"niagara_falls", "statue_of_liberty", "times_square"
]
    
static let artworks: [Artwork] = [
Artwork(name: "Mural1", artist: "Artist A", latitude: 40.7128, longitude: -74.0060, visited: false),
Artwork(name: "Mural2", artist: "Artist B", latitude: 34.0522, longitude: -118.2437, visited: true),
Artwork(name: "Mural3", artist: "Artist C", latitude: 51.5074, longitude: -0.1278, visited: false)
]
    
    
static let sanctuaries: [Sanctuary] = [
Sanctuary(name: "Yellowstone National Park", features: "Bird Watching, Hiking", latitude: 44.4280,
longitude: -110.5885, hasEndangeredSpecies: true),
Sanctuary(name: "Everglades National Park", features: "Swamp Tours, Endangered Species", latitude:
25.2866, longitude: -80.8987, hasEndangeredSpecies: true),
Sanctuary(name: "Grand Canyon National Park", features: "Scenic Views, Trails", latitude: 36.1069,
longitude: -112.1129, hasEndangeredSpecies: false)
]
}

