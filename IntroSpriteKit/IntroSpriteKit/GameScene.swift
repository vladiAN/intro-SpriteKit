//
//  GameScene.swift
//  IntroSpriteKit
//
//  Created by Андрушок on 27.12.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var circle = SKShapeNode(circleOfRadius: 50)
    var moveCircle = CGAffineTransform()
    var speedMove: Double = 1000.0
    

    override func didMove(to view: SKView) {
        
        changeBackground()
        setupCircle()
    }
    
    func changeBackground() {
        let changeBackground = SKAction.sequence([
            .wait(forDuration: 1),
            .run { self.backgroundColor = UIColor.random }
        ])
        self.run(.repeatForever(changeBackground))
    }
    
    func setupCircle() {
        circle.fillColor = .red
        circle.position.x = frame.midX
        circle.position.y = frame.midY
        self.addChild(circle)
        
        let sqns = SKAction.sequence([
            .wait(forDuration: 1),
            .run { self.frameForMove() },
        ])
        self.run(.repeatForever(sqns), withKey: "speed")
    }

    
    override func update(_ currentTime: TimeInterval) {
            if let action = self.action(forKey: "speed") {

                action.speed = self.speedMove
            }
        }
    
     func frameForMove() {
        
        if circle.frame.maxY >= self.frame.maxY {
            moveCircle.ty = -10.0
        }
        
        if circle.frame.maxX >= self.frame.maxX {
            moveCircle.tx = -10.0
        }
        
        if circle.frame.minY <= self.frame.minY {
            moveCircle.ty = 10.0
        }
        
        if circle.frame.minX <= self.frame.minX {
            moveCircle.tx = 10.0
        }
        
        circle.position = circle.position.applying(moveCircle)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            moveCircle = CGAffineTransform(translationX: 10, y: 10)
        }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
