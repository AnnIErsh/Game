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
        #if os(tvOS)
        VStack {
            content
                .ignoresSafeArea(.all)
        }
        .environmentObject(NavigationViewModel())
        #else
        ZStack(alignment: .topTrailing, content: {
            content
        })
        .environmentObject(NavigationViewModel())
        #endif
    }
    
    @ViewBuilder var content: some View {
        Navigation(transition: Transition.custom(.slide)) {
            ContainerScreen(selected: $selected)
            .padding()            
        }
        Button("Open Menu") {
            isPresented.toggle()
        }
        .dynamicTypeSize(.small)
        .padding(.trailing)
        .showMenu(isPresented: $isPresented,
                  selected: $selected,
                  screen: MenuScreen(selected: $selected).lazy.toAnyView)
    }
}
