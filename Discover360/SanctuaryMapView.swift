//
//  SanctuaryMapView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//
//// Purpose: Interactive map of sanctuaries with custom annotations & detail sheet.

import SwiftUI
import MapKit
// MARK: - SanctuaryMapView

struct SanctuaryMapView: View {
    @State private var sanctuaries = SampleData.sanctuaries
    // Wide initial region centered over continental US for context.}
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795),
        span: MKCoordinateSpan(latitudeDelta: 30.0, longitudeDelta: 30.0)
        )
    
    @State private var selected: Sanctuary? = nil
    
    var body: some View {
        NavigationStack {
        Map(position:
        .constant(.region(region))) {
                        ForEach(sanctuaries) { s in
                        Annotation(s.annotationTitle, coordinate: s.location) {
                            VStack(spacing: 6) {
                                Image(systemName: "leaf.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(s.hasEndangeredSpecies ? .red : .green)
                                Text(s.annotationTitle)
                                    .font(.caption)
                                    .padding(6)
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                                .onTapGesture { selected = s }
                                }
                                }
                                }
                                
                                .navigationTitle("Wildlife Sanctuary Explorer")
                                .sheet(item: $selected) { s in
                                    SanctuaryDetailView(sanctuary: s)
                    }
        }
    }
}

// MARK: - Preview
#Preview {
    SanctuaryMapView()
        .ignoresSafeArea()
}
