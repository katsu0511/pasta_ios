import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    var musicData: Data!
    var pastaData: Data!
    var musicPlayer: AVAudioPlayer!
    var pastaPlayer: AVAudioPlayer!

    override init() {
        do {
            musicData = NSDataAsset(name: "full")!.data
            pastaData = NSDataAsset(name: "pasta")!.data
            musicPlayer = try AVAudioPlayer(data: musicData)
            pastaPlayer = try AVAudioPlayer(data: pastaData)
        } catch {
            print("Load Error")
        }
    }

    func playMusic() {
        musicPlayer.play()
    }

    func pauseMusic() {
        musicPlayer?.pause()
    }

    func stopMusic() {
        musicPlayer?.stop()
        musicPlayer.currentTime = 0
    }

    func backwardMusic() {
        musicPlayer?.currentTime -= 10
    }

    func forwardMusic() {
        musicPlayer?.currentTime += 10
    }

    func pasta() {
        pastaPlayer.play()
    }
}
