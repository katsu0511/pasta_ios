import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    var music_data: Data!
    var pasta_data: Data!
    var music_player: AVAudioPlayer!
    var pasta_player: AVAudioPlayer!
    
    override init() {
        do {
            music_data = NSDataAsset(name: "full")!.data
            pasta_data = NSDataAsset(name: "pasta")!.data
            music_player = try AVAudioPlayer(data: music_data)
            pasta_player = try AVAudioPlayer(data: pasta_data)
        } catch {
            print("load error")
        }
    }
    
    func playMusic() {
        music_player.play()
    }
    
    func pauseMusic() {
        music_player?.pause()
    }
    
    func stopMusic() {
        music_player?.stop()
    }
    
    func backwardMusic() {
        music_player?.currentTime -= 10
    }
    
    func forwardMusic() {
        music_player?.currentTime += 10
    }
    
    func pasta() {
        pasta_player.play()
    }
}
