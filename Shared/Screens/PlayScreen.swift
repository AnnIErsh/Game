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
        #if os(iOS) || os(tvOS)
        let size = CGSize(width: UIScreen.main.bounds.size.width,
                          height: UIScreen.main.bounds.size.height)
        #elseif os(macOS)
        let size = CGSize(width: NSScreen.main?.visibleFrame.size.width ?? 800,
                          height: NSScreen.main?.visibleFrame.size.height ?? 600)
        #endif
        let scene = GameScene(size: size)
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
