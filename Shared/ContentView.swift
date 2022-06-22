//
//  ContentView.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI
import SpriteKit
import Navigation

struct ContentView: View {
    @State var selected: Mode = Mode.play
    @State private var isPresented = false

    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            Navigation(transition: Transition.custom(.slide)) {
                ContainerScreen(selected: $selected)
                .padding()
            }
            Button("Open Menu") {
                isPresented.toggle()
            }
            .padding(.trailing)
            .showMenu(isPresented: $isPresented, selected: $selected)
            .environmentObject(NavigationViewModel())
        })
    }
}
