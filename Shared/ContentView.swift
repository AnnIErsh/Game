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
    @State var selected: Mode = Mode.settings
    @ObservedObject var route = NavigationViewModel()
    
    var body: some View {
        VStack {
            Navigation(transition: Transition.custom(.slide)) {
                ContainerScreen(selected: $selected)
            }
            Picker("Show: ", selection: $selected, content: {
                ForEach(Modes.shared.modes.indices, id:\.self) { i in
                    Text(Modes.shared.modes[i].rawValue)
                        .tag(Modes.shared.modes[i])
                }
                .onChange(of: selected) { newValue in
                    print(newValue.rawValue)
                    route.pop()
                    selected = newValue
                    let new = ContainerScreen(selected: $selected).lazy.toAnyView()
                    route.push(screeView: new)
                }
            })
        }
        .pickerStyle(.segmented)
        .environmentObject(NavigationViewModel())
    }
}
