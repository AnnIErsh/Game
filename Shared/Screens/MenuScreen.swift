//
//  MenuScreen.swift
//  Game
//
//  Created by Anna Ershova on 18.06.2022.
//

import Foundation
import SwiftUI
import Navigation

struct MenuScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var route = NavigationViewModel()
    @Binding var selected: Mode
    @State private var selectedRow: Int?
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                ForEach(Modes.shared.modes.indices, id:\.self) { i in
                    Button("\(Modes.shared.modes[i].rawValue)") {
                        selectedRow = i
                        pushScreen(index: i)
                    }
                    .tag(Modes.shared.modes[i])
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .opacity(
                        selectedRow == i ? 0.1 : 1
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.black)
                .padding()
            }
        }
    }
    
    private func pushScreen(index: Int) {
        route.pop()
        selected = Modes.shared.modes[index]
        let new = ContainerScreen(selected: $selected).lazy.toAnyView()
        route.push(screeView: new)
        presentationMode.wrappedValue.dismiss()
    }
}
