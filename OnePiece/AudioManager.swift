import Foundation
import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?
    @Published var isMuted = false
    
    init() {
        setupAudio()
    }
    
    private func setupAudio() {
        if let path = Bundle.main.path(forResource: "one-piece_we-are", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = -1 // Loop indefinitely
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }
    
    func playBackgroundMusic() {
        audioPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        audioPlayer?.stop()
    }
    
    func toggleMute() {
        isMuted.toggle()
        if isMuted {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
    }
} 