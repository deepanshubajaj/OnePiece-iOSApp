//
//  CharacterInfo.swift
//  OnePiece
//
//  Created by Deepanshu Bajaj on 16/05/25.
//

import SwiftUI

struct CharacterInfo: View {
    @Environment(\.dismiss) private var dismiss
    let name: String
    let character: StrawHats
    
    var body: some View {
        ScrollView {
            VStack {
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 310)
                    .clipped()
            }
            .shadow(radius: 5)
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.white.opacity(0.5))
                    .padding(.vertical)
                    .padding(.horizontal)
                    
                Text("Bounty: \(character.bounty)")
                    .font(.title2)
                    .foregroundStyle(.black.opacity(0.4))
                    .padding(.bottom)
                    
                Text(character.description)
                    
                Spacer()
                Spacer()
            }
            .padding([.leading, .trailing, .bottom])
        }
        .preferredColorScheme(.light)
        .padding([.top, .bottom])
        .ignoresSafeArea()
        .background(Color.blue.opacity(0.6))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    let charactersData: [String: StrawHats] = Bundle.main.loadData("Characters.json")
    if let characterInfo = charactersData["luffy"] {
        return CharacterInfo(name: "luffy", character: characterInfo)
    }
    return ContentView()
}
