//
//  TypeViewModel.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import Foundation
import SwiftUI

final class TypeViewModel: ObservableObject {
    @Published var head: Mode = .play

    var mode: Mode {
        get { head }
        set { head = newValue }
    }
    
    @ViewBuilder
    func makeScreen(_ type: Mode) -> some View {
        switch type {
        case .play:
            PlayScreen()
        case .settings:
            Settings()
        case .leaders:
            LeaderboardScreen()
        }
    }
}
