//
//  OnePieceApp.swift
//  OnePiece
//
//  Created by Deepanshu Bajaj on 16/05/25.
//

import SwiftUI

@main
struct OnePieceApp: App {
    @State private var isShowingSplash = true
    @StateObject private var audioManager = AudioManager.shared
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashScreen(isShowingSplash: $isShowingSplash)
                    .onAppear {
                        audioManager.playBackgroundMusic()
                    }
            } else {
                ContentView()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                if !audioManager.isMuted {
                    audioManager.playBackgroundMusic()
                }
            case .background, .inactive:
                audioManager.stopBackgroundMusic()
            @unknown default:
                break
            }
        }
    }
}
