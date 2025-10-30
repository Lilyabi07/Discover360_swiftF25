//
//  TourScrollView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//// Purpose: Original vertical scrolling gallery using PanoramaView.

import SwiftUI

struct TourScrollView: View {
    let imageNames: [String]
    
    var body: some View{
        ScrollView {
            VStack(spacing: 20){
                ForEach(imageNames, id: \.self) {imageName in
                    PanoramaView(imageName: imageName)
                        .scrollTransition{content, phase in
                            
                            //modify the content (the image) based on the scroll phase
                            content
                                .scaleEffect(phase.isIdentity ? 1: 0.5)
                            // Change the opacity of the image based on the scroll phase.
                                .opacity(phase.isIdentity ? 1 : 0.5)
                            }
                        .padding(.horizontal)
                    
                        }
                    }
                    .padding(.top)
                            }
                            .navigationTitle("Tour (Scroll)")
                            
                        }
                }
// MARK: - Preview
#Preview {
NavigationStack {
TourScrollView(imageNames: SampleData.panoramaImageNames)
}
}
