//
//  ext+GameScene.swift
//  GameiOS
//
//  Created by Anna Ershova on 04.07.2022.
//

import Foundation
import SpriteKit

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moving()
        handleActions(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleActions(touches)
    }
    
    func handleActions(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        handleLocation(location: location)
    }
}
