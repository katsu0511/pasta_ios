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

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    musicplayer.playMusic()
                }) {
                    Image("play")
                }
                .buttonStyle(.borderedProminent)
                Button(action: {
                    musicplayer.stopMusic()
                }) {
                    Image("stop")
                }
                .buttonStyle(.borderedProminent)
            }
            
            Button(action: {
                musicplayer.pasta()
            }) {
                Text("pasta")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
