//
//  GameScene3.swift
//  MyToys
//
//  Created by Asma Mohammed on 14/08/1446 AH.
//

import Foundation
import SpriteKit

var girl3: SKSpriteNode!
var herp3: SKSpriteNode!
var cloud3: SKSpriteNode!
var TextBackGround: SKSpriteNode!
var buterfly3: SKSpriteNode!
var Lebal3: SKLabelNode!
var ButtonLetsPlay: SKSpriteNode!

class GameScene3: SKScene {
    
    override func didMove(to view: SKView) {
        // Safely unwrap using optional binding
        if let girlNode = self.childNode(withName: "girl3") as? SKSpriteNode {
            girl3 = girlNode
        }
        
        if let herpNode = self.childNode(withName: "herp3") as? SKSpriteNode {
            herp3 = herpNode
        }
        
        if let cloudNode = self.childNode(withName: "cloud3") as? SKSpriteNode {
            cloud3 = cloudNode
        }
        
        if let textBackgroundNode = self.childNode(withName: "TextBackGround") as? SKSpriteNode {
            TextBackGround = textBackgroundNode
        }
        
        if let butterflyNode = self.childNode(withName: "buterfly3") as? SKSpriteNode {
            buterfly3 = butterflyNode
        }
        
        if let labelNode = self.childNode(withName: "Lebal3") as? SKLabelNode {
            Lebal3 = labelNode
            Lebal3.fontName = "MarkerFelt-Wide"
            Lebal3.text = "Ready To Play?"
            Lebal3.fontSize = 24
            Lebal3.horizontalAlignmentMode = .center
        }
        
        if let buttonNode = self.childNode(withName: "ButtonLetsPlay") as? SKSpriteNode {
            ButtonLetsPlay = buttonNode
        }
        
        self.backgroundColor = SKColor.background1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            // Check if the button is touched and visible
            if ButtonLetsPlay.contains(location) && ButtonLetsPlay.alpha == 1.0 {
                handleButtonPress()
            }
        }
    }
    
    func handleButtonPress() {
        // Add pulse effect
        let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)
        let scaleNormal = SKAction.scale(to: 1.0, duration: 0.1)
        let pulseSequence = SKAction.sequence([scaleDown, scaleUp, scaleNormal])
        
        // Run pulse effect, then transition
        ButtonLetsPlay.run(pulseSequence) {
            // Transition to next scene after effect
            self.goToNextScene()
        }
    }
    
    func goToNextScene() {
        if let nextScene = SKScene(fileNamed: "GameScene4") {
            nextScene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(nextScene, transition: transition)
        }
    }
}
