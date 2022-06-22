//
//  PlayScreen.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI
import SpriteKit

struct PlayScreen: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.scaleMode = .fill
        scene.backgroundColor = CustomColor(hex: 0x856efa, alpha: 1)
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
