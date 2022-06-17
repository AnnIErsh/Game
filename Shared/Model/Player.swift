//
//  Player.swift
//  Game
//
//  Created by Anna Ershova on 17.06.2022.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
}

final class Players {
    static var shared = Players()
    lazy var players: [Player] = [Player(name: "Player 1", score: 1000),
                                  Player(name: "Player 2", score: 1000),
                                  Player(name: "Player 3", score: 1000)]
    var colors: [Color] = [Color(red: 176 / 255, green: 140 / 255, blue: 232 / 255),
                           Color(red: 162 / 255, green: 166 / 255, blue: 206 / 255), .white]
}

