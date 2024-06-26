//
//  ContentView.swift
//  Pasta
//
//  Created by Katsuya Harada on 2024/06/14.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var playButton = "play"
    @State private var isStopDisabled = true
    @State private var stopButton = "invalid_stop"
    @State private var isBackwardDisabled = true
    @State private var backwardButton = "invalid_backward"
    @State private var isForwardDisabled = true
    @State private var forwardButton = "invalid_forward"
    @State private var seekPosition: Double = 0.0
    let player = SoundPlayer()

    init() {
        UISlider.appearance().thumbTintColor = .systemBlue
    }

    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 16)
                Slider(
                    value: $seekPosition,
                    in: 0...1,
                    onEditingChanged: { _ in
                        player.musicPlayer.currentTime = seekPosition * player.musicPlayer.duration
                    }
                )
                .onReceive(player.timer) { _ in
                    if (player.musicPlayer.isPlaying) {
                        seekPosition = player.musicPlayer.currentTime / player.musicPlayer.duration
                    } else {
                        player.stopTimer()
                    }
                }
                Spacer().frame(width: 16)
            }

            HStack {
                Spacer().frame(width: 16)
                Text(player.getMinute(sec: Int(round(player.musicPlayer.duration * seekPosition))))
                Spacer()
                Text("-" + player.getMinute(sec: Int(round(player.musicPlayer.duration * (1 - seekPosition)))))
                Spacer().frame(width: 16)
            }

            Spacer().frame(height: 32)

            HStack {
                Button(action: {
                    if (!isBackwardDisabled) {
                        player.backwardMusic()
                        if (seekPosition > 5 / player.musicPlayer.duration) {
                            seekPosition -= 5 / player.musicPlayer.duration
                        } else {
                            seekPosition = 0
                        }
                    }
                }) {
                    Image(backwardButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                .disabled(isBackwardDisabled)

                Button(action: {
                    if (playButton == "play") {
                        player.playMusic()
                        player.startTimer()
                        playButton = "pause"
                        isStopDisabled = false
                        stopButton = "stop"
                        isBackwardDisabled = false
                        backwardButton = "backward"
                        isForwardDisabled = false
                        forwardButton = "forward"
                    } else if (playButton == "pause") {
                        player.pauseMusic()
                        player.stopTimer()
                        playButton = "play"
                    }
                }) {
                    Image(playButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }

                Button(action: {
                    if (!isStopDisabled) {
                        player.stopMusic()
                        seekPosition = 0.0
                        player.stopTimer()
                        playButton = "play"
                        isStopDisabled = true
                        stopButton = "invalid_stop"
                        isBackwardDisabled = true
                        backwardButton = "invalid_backward"
                        isForwardDisabled = true
                        forwardButton = "invalid_forward"
                    }
                }) {
                    Image(stopButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                .disabled(isStopDisabled)

                Button(action: {
                    if (!isForwardDisabled) {
                        player.forwardMusic()
                        if (1 - seekPosition > 5 / player.musicPlayer.duration) {
                            seekPosition += 5 / player.musicPlayer.duration
                        } else {
                            seekPosition = 1
                        }
                    }
                }) {
                    Image(forwardButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                .disabled(isForwardDisabled)
            }

            Spacer().frame(height: 32)

            Button(action: {
                player.pasta()
            }) {
                Text("Pasta")
                    .padding(.init(top: 20, leading: 90, bottom: 20, trailing: 90))
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
