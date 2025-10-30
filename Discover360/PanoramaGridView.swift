//
//  PanoramaGridView.swift
//  Discover360
//
//  Created by B.B.A on 2025-09-16.
//
// Purpose: Grid of panoramas with fixed-size, padded tiles to avoid overlap.
// MARK: - Imports
import SwiftUI
// MARK: - PanoramaGridView
struct PanoramaGridView: View {
let imageNames: [String]
/// Adaptive grid: as many columns as fit with minimum 160pt.
private let columns = [GridItem(.adaptive(minimum: 160), spacing: 40)]
@State private var selectedImage: String? = nil
    

var body: some View {
ScrollView {
LazyVGrid(columns: columns, spacing: 16) {
ForEach(imageNames, id: \.self) { name in
PanoramaTile(name: name)
.onTapGesture { selectedImage = name }
}
}
.padding(16)
}
.navigationTitle("Panorama Grid")
.sheet(item: $selectedImage) { name in
NavigationStack {
VStack {
PanoramaView(imageName: name)
Spacer()
}
.toolbar {
ToolbarItem(placement: .topBarTrailing) {
Button("Done") { selectedImage = nil }
}
}
}
}
}
}
// MARK: - PanoramaTile
/// Each tile has a fixed overall height so rows align perfectly.
private struct PanoramaTile: View {
let name: String

var body: some View {
VStack(spacing: 8) {
Image(name)
.resizable()
.aspectRatio(16/9, contentMode: .fill)
.frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
.clipped()
.cornerRadius(10)
Text(name.replacingOccurrences(of: "_", with: " ").capitalized)
.font(.caption)
.lineLimit(1)
.frame(maxWidth: .infinity, alignment: .leading)
}
.padding(8)
.frame(height: 150) // total tile height (image + text + padding)
.background(.ultraThinMaterial)
.clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
.shadow(radius: 1, y: 1)
}
}
// Make String identifiable for .sheet(item:)
extension String: Identifiable { public var id: String { self } }
// MARK: - Preview
#Preview {
NavigationStack {
PanoramaGridView(imageNames: SampleData.panoramaImageNames)
}
}
