//
//  PlayScreen.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI
import SpriteKit

struct PlayScreen: View {
    @State var isOver: Bool = false
 
    var change: ((Bool) -> Void)?
    
    var gameScene: GameScene = {
        let scene = GameScene(size: ScreenSize.size)
        scene.backgroundColor = CustomColor(hex: 0xc7caf9, alpha: 1)
        scene.scaleMode = .aspectFit
        return scene
    }()
    
    var scene: SKScene {
        gameScene
    }
    
    var sprite: some View {
        SpriteView(scene: scene)
            .border(.black, width: 8)
            .ignoresSafeArea(.all)
            .onAppear {
                gameScene.change = { i in
                    if i {
                        gameScene.removeAllActions()
                        gameScene.removeAllChildren()
                        gameScene.reset = true
                        isOver = true
                    }
                    else {
                        isOver = false
                    }
                }
            }
    }
    
    var body: some View {
        sprite
            #if os(tvOS)
            .focusable()
            #endif
            .showMenu(isPresented: $isOver, selected: nil, screen: GameOverScreen().lazy.toAnyView)
    }
}
