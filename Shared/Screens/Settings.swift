//
//  Settings.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI

struct Settings: View {
    @State private var show = true
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("Settings")
            Spacer(minLength: 40)
            List {
                Toggle(isOn: $show, label: {
                    Text("Enable Notifications")
                })
                .listRowBackground(Color.clear)
                HStack {
                    Text("Volume")
                    VStack {
                        Slider(value: $speed, in: 0...100, onEditingChanged: { editing in
                            isEditing = editing
                        })
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

