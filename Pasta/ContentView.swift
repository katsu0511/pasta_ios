//
//  ContentView.swift
//  Pasta
//
//  Created by Katsuya Harada on 2024/06/14.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let musicplayer = SoundPlayer()
    @State private var playButton = "play"

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    musicplayer.backwardMusic()
                }) {
                    Image("backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                Button(action: {
                    musicplayer.playMusic()
                }) {
                    Image(playButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                Button(action: {
                    musicplayer.stopMusic()
                }) {
                    Image("stop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                Button(action: {
                    musicplayer.forwardMusic()
                }) {
                    Image("forward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
            }

            Spacer().frame(height: 32)

            Button(action: {
                musicplayer.pasta()
            }) {
                Text("pasta")
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
