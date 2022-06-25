//
//  GameScene.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    
    var change: ((Bool) -> Void)?
    
    var reset: Bool? {
        didSet {
            if let new = self.view {
                didMove(to: new)
            }
        }
    }
    
    var area = CGRect()
  
    let label: SKLabelNode = {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "My Super Game"
        return label
    }()
    
    let stop: SKLabelNode = {
        let label = SKLabelNode(text: "EXIT")
        label.fontColor = CustomColor.black
        return label
    }()
    
    let player = SKSpriteNode(imageNamed: "player")
    var rect: SKSpriteNode?
    
    override init(size: CGSize) {
        super.init(size: size)
        area = self.frame
    }
            
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: area)
        label.fontSize = size.height * 0.05
        label.position = CGPoint(x: size.width * 0.5, y: size.height * 0.9)
        addChild(label)
        player.position = CGPoint(x: area.width * 0.5, y: area.height * 0.8)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        addChild(player)
        stop.position = CGPoint(x: size.width * 0.5, y: size.height * 0.8)
        stop.fontSize = size.height * 0.04
        addChild(stop)
    }
    
    func moving() {
        let lineY = size.height * 0.1
        let left = SKAction.move(to: CGPoint(x: area.minX, y: lineY), duration: 2.0)
        let right = SKAction.move(to: CGPoint(x: area.maxX, y: lineY), duration: 2.0)
        let action = SKAction.repeatForever(SKAction.sequence([left, right]))
        player.run(action) {
            self.removeAllActions()
        }
    }
    
    #if os(iOS) || os(tvOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moving()
        handleActions(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleActions(touches, with: event)
    }
    
    func handleActions(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        handleLocation(location: location)
    }
    
    #elseif os(macOS)
    override func mouseDown(with event: NSEvent) {
        moving()
        let location = event.location(in: self)
        handleLocation(location: location)
    }

    override func mouseDragged(with event: NSEvent) {
        let location = event.location(in: self)
        handleLocation(location: location)
    }
    #endif
    
    func handleLocation(location: CGPoint) {
        if stop.contains(location) {
            self.userActivity = .none
            change?(true)
            player.removeAllActions()
            return
        }
        else { change?(false) }
        let ball = SKSpriteNode(texture: SKTexture(image: UIImage(named: "pokeball")!))
        ball.position = location
        ball.colorBlendFactor = 0.4
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.width * 0.5)
        addChild(ball)
        if player.contains(location) {
            if let rect = rect {
                rect.removeFromParent()
                rect.size = player.size
                rect.position = player.position
                addChild(rect)
                player.removeAllActions()
            }
            else {
                rect = SKSpriteNode(texture: SKTexture(image: UIImage(named: "hit")!))
                rect?.colorBlendFactor = 0.5
            }
        }
    }
}
