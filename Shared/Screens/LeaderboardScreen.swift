//
//  LeaderboardScreen.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI

struct LeaderboardScreen: View {
    var body: some View {
        VStack {
            Text("Leaderboard!")
            HStack {
                List {
                    Section("Name") {
                        ForEach(Players.shared.players) { i in
                            HStack {
                                Text("\(i.name)")
                                Spacer()
                                Text("\(i.score)")
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
        }
    }
}
