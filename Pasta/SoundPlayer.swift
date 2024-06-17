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
        musicPlayer?.currentTime -= 5
    }

    func forwardMusic() {
        musicPlayer?.currentTime += 5
    }

    func pasta() {
        musicPlayer.volume = 0
        pastaPlayer.play()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        musicPlayer.volume = 1
    }
    
    func getMinute(sec: Int) -> String {
        var minute = 0
        var second = sec
        var secondStr = ""
        while(second >= 60) {
            minute += 1
            second -= 60
        }
        if (second < 10) {
            secondStr = "0\(second)"
        } else {
            secondStr = "\(second)"
        }

        return "\(minute):\(secondStr)"
    }
}
