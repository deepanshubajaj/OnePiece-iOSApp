//
//  ContentView.swift
//  OnePiece
//
//  Created by Deepanshu Bajaj on 16/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var arcs: [Arc] = Bundle.main.loadData("Arcs.json")
    @State private var strawHats: [String: StrawHats] = Bundle.main.loadData("Characters.json")
    @State private var searchText = ""
    @StateObject private var audioManager = AudioManager.shared
    
    let columns = [
        GridItem(.flexible(minimum: 90, maximum: .infinity)),
        GridItem(.flexible(minimum: 90, maximum: .infinity))
    ]
    
    var filteredArcs: [Arc] {
        if searchText.isEmpty {
            return arcs
        }
        return arcs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    TextField("Search Arcs", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button(action: {
                        audioManager.toggleMute()
                    }) {
                        Image(systemName: audioManager.isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: columns) {
                    ForEach(filteredArcs) { arc in
                        NavigationLink {
                            ArcInfo(arc: arc, characters: strawHats)
                        } label: {
                            VStack(alignment: .center) {
                                Image(arc.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 210)
                                
                                Text(arc.name)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .fontDesign(.rounded)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                
                                Text("Straw Hats: \(arc.straw_hats.count)")
                                    .font(.subheadline)
                                    .foregroundColor(.black.opacity(0.4))
                                    .fontDesign(.rounded)
                            }
                            .frame(width: 140, height: 260)
                            .padding([.horizontal, .vertical])
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .preferredColorScheme(.light)
            .padding([.top, .bottom])
            .background(Color.blue.opacity(0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
