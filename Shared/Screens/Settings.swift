//
//  Settings.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI

struct Settings: View {
    @State private var show = true
    @State private var speed: Float = 50
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("Settings").bold()
            Spacer(minLength: 40)
            List {
                Toggle(isOn: $show, label: {
                    Text("Enable Notifications").bold()
                })
                .listRowBackground(Color.clear)
                HStack {
                    Text("Volume").bold()
                    Divider()
                    VStack {
                        CustomSlider.produce(value: $speed) { editing in
                            isEditing = editing
                        }
                        Text("\(Int(speed))")
                            .foregroundColor(isEditing ? .red : .blue)
                    }
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
    }
}

