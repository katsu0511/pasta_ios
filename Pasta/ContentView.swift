//
//  ContentView.swift
//  Pasta
//
//  Created by Katsuya Harada on 2024/06/14.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let player = SoundPlayer()
    @State private var playButton = "play"

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    player.backwardMusic()
                }) {
                    Image("backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                Button(action: {
                    player.playMusic()
                }) {
                    Image(playButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                Button(action: {
                    player.stopMusic()
                }) {
                    Image("stop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                Button(action: {
                    player.forwardMusic()
                }) {
                    Image("forward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
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
