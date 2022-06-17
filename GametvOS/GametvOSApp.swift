//
//  GametvOSApp.swift
//  GametvOS
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI

@main
struct GametvOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

typealias FocusChangeCallback = (Bool) -> Void

struct FocusTracker: View {
    @Environment(\.isFocused) var isFocused
    let action: FocusChangeCallback

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .onChange(of: isFocused) { value in
                action(value)
            }
    }
}
