//
//  GameOverScreen.swift
//  Game
//
//  Created by Anna Ershova on 24.06.2022.
//

import SwiftUI

struct GameOverScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            CustomColor.gradient
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Game Over / Pause")
                    .padding()
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.black)
                .background(.white)
            }
        }
    }
}
