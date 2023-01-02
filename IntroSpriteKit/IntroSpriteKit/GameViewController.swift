//
//  GameViewController.swift
//  IntroSpriteKit
//
//  Created by Андрушок on 27.12.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var scene = GameScene()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let circle = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                circle.scaleMode = .aspectFill
                scene = circle as! GameScene
                // Present the scene
                view.presentScene(circle)
            }

            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    @IBAction func qwer(_ sender: Any) {
        let slider = (sender as! UISlider)
        scene.speedMove = Double(slider.value * 100)

    }
}

