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
    let player = SoundPlayer()

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if (!isBackwardDisabled) {
                        player.backwardMusic()
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
                        playButton = "pause"
                        isStopDisabled = false
                        stopButton = "stop"
                        isBackwardDisabled = false
                        backwardButton = "backward"
                        isForwardDisabled = false
                        forwardButton = "forward"
                    } else if (playButton == "pause") {
                        player.pauseMusic()
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
