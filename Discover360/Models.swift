//
//  Models.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.

//
import SwiftUI

import CoreLocation


// represents a public artowrk with coodinates and a matching asset image name

struct Artwork: Identifiable,Hashable {
    
    let id = UUID()
    let name : String
    let artist: String
    let latitude: Double
    let longitude: Double
    var visited: Bool
    
    
    
    //convenience coordinates for map annotation
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D (latitude: latitude, longitude: longitude)
        
    }
    
    //loading an image fom assets using the asset name
    
    var image: Image {Image(name)}
}
    
    //mark sanctuary: represents  a wildlife sanctuary with a flag for endagered species
    
    struct Sanctuary: Identifiable,Hashable {
        
        let id = UUID()
        let name: String
        let features: String
        let latitude: Double
        let longitude: Double
        let hasEndangeredSpecies: Bool
        
        var location: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        
        //title shown near the pin -- adds endagered species flag when applicable
        var annotationTitle: String {
        hasEndangeredSpecies ? "\(name) (Endangered Species)" : name
        }
        }
    
