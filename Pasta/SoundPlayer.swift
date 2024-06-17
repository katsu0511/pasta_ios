import UIKit
import AVFoundation

class SoundPlayer: NSObject, AVAudioPlayerDelegate {
    var musicData: Data!
    var pastaData: Data!
    var musicPlayer: AVAudioPlayer!
    var pastaPlayer: AVAudioPlayer!

    override init() {
        super.init()

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            musicData = NSDataAsset(name: "full")!.data
            pastaData = NSDataAsset(name: "pasta")!.data
            musicPlayer = try AVAudioPlayer(data: musicData)
            pastaPlayer = try AVAudioPlayer(data: pastaData)
            pastaPlayer.delegate = self
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
        musicPlayer?.currentTime = 0
    }

    func backwardMusic() {
        musicPlayer?.currentTime -= 10
    }

    func forwardMusic() {
        musicPlayer?.currentTime += 10
    }

    func pasta() {
        musicPlayer.volume = 0
        pastaPlayer.play()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        musicPlayer.volume = 1
    }
}
