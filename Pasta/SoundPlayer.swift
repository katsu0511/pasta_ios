import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let music_data = NSDataAsset(name: "full")!.data
    let pasta_data = NSDataAsset(name: "pasta")!.data
    var music_player: AVAudioPlayer!
    var pasta_player: AVAudioPlayer!
    
    func playMusic() {
        do {
            music_player = try AVAudioPlayer(data: music_data)
            music_player.play()
        } catch {
            print("エラー発生.音を流せません")
        }
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
        do {
            pasta_player = try AVAudioPlayer(data: pasta_data)
            pasta_player.play()
        } catch {
            print("エラー発生.音を流せません")
        }
    }
}
