//
//  SanctuaryDetailView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//
// Purpose: Details for a selected sanctuary (presented as a sheet from the map).


import SwiftUI

struct SanctuaryDetailView: View {
    
    let sanctuary: Sanctuary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(sanctuary.name)
                .font(.largeTitle).bold()
            
            Text("Features: \(sanctuary.features)")
                .font(.title2)
            
            if sanctuary.hasEndangeredSpecies{
                Text("Tjis sanctuary containes endagered species")
                    .foregroundStyle(.red)
                    .font(.headline)
            }
            else{
                Text("No endangered species found in this sanctuary")
                    .foregroundStyle(.blue)
                    .font(.headline)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview{
    SanctuaryDetailView(sanctuary: SampleData.sanctuaries.first!)
        .padding()
}
