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
    @ObservedObject var route = NavigationViewModel()
    
    var body: some View {
        VStack {
            Navigation(transition: Transition.custom(.slide)) {
                ContainerScreen(selected: $selected)
            }
            Spacer()
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
            .pickerStyle(.segmented)
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 176 / 255, green: 140 / 255, blue: 232 / 255), Color(red: 162 / 255, green: 166 / 255, blue: 206 / 255), .white]),
                           startPoint: .top,
                           endPoint: .bottom))
        .environmentObject(NavigationViewModel())
    }
}
