//
//  ext+GameScene.swift
//  GameMacOS
//
//  Created by Anna Ershova on 04.07.2022.
//

import Foundation
import AppKit

extension GameScene {
    override func mouseDown(with event: NSEvent) {
        moving()
        let location = event.location(in: self)
        handleLocation(location: location)
    }
    
    override func mouseDragged(with event: NSEvent) {
        let location = event.location(in: self)
        handleLocation(location: location)
    }
}

