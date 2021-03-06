//
//  Modes.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import Foundation

enum Mode: String, CaseIterable {
    case settings = "Settings"
    case play = "Play"
    case leaders = "Leaderboard"
}

final class Modes {
    static let shared = Modes()
    lazy var modes = Mode.allCases
}
