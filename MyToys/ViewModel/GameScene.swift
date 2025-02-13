//
//  GameScene.swift
//  MyToys
//
//  Created by Asma Mohammed on 14/08/1446 AH.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var herp: SKSpriteNode!
    var girl: SKSpriteNode!
    var cloud1: SKSpriteNode!
    var cloud2: SKSpriteNode!
    var Butterfly1: SKSpriteNode!
    var butterfly2: SKSpriteNode!
    var button: SKSpriteNode!
    var touchLocation = CGPoint()
    var hero = SKSpriteNode()
    var Lebal1 = SKLabelNode()
    var Lebal2  = SKLabelNode()
    var Lebal3  = SKLabelNode()
    var home = SKSpriteNode()
    var homeNormal = SKSpriteNode()
    
    
    
    override func didMove(to view: SKView) {
        // Load nodes from the scene (assuming these nodes exist in your .sks file)
        if let label1 = self.childNode(withName: "Lebal1") as? SKLabelNode {
            Lebal1 = label1
            Lebal1.fontName = "MarkerFelt-Wide"
            Lebal1.text = "This is Elsa\nA child with a vision\nDisability\nShe has colorblindness"
            Lebal1.fontSize = 24
            Lebal1.horizontalAlignmentMode = .center
            Lebal1.verticalAlignmentMode = .center
            Lebal1.preferredMaxLayoutWidth = 300
            Lebal1.numberOfLines = 0
        }
        
        if let label2 = self.childNode(withName: "Lebal2") as? SKLabelNode {
            Lebal2 = label2
            Lebal2.fontName = "MarkerFelt-Wide"
            Lebal2.text = "She needs help to collect\nher toys"
            Lebal2.fontSize = 24
            Lebal2.horizontalAlignmentMode = .center
            Lebal2.verticalAlignmentMode = .center
            Lebal2.preferredMaxLayoutWidth = 300
            Lebal2.numberOfLines = 0
        }
        if let label3 = self.childNode(withName: "Lebal3") as? SKLabelNode {
            Lebal3 = label3
            Lebal3.fontName = "MarkerFelt-Wide"
            Lebal3.text = "this how she could see\nher yoys"
            Lebal3.fontSize = 24
            Lebal3.horizontalAlignmentMode = .center
        }
        
        home = (self.childNode(withName: "home") as? SKSpriteNode)!
        homeNormal = (self.childNode(withName: "homeNormal") as? SKSpriteNode)!
        button = self.childNode(withName: "button") as? SKSpriteNode
        girl = self.childNode(withName: "girl") as? SKSpriteNode
        cloud1 = self.childNode(withName: "cloud1") as? SKSpriteNode
        cloud2 = self.childNode(withName: "cloud2") as? SKSpriteNode
        
        // Ensure cloud1 and cloud2 are already present in the scene
        if cloud1 != nil && cloud2 != nil {
            moveClouds() // Call the move function to start moving both clouds
        } else {
            print("Cloud nodes are not found in the scene.")
        }
        
        // Fade-in effect for the girl sprite
        if let girl = girl {
            girl.alpha = 0
            let fadeInAction = SKAction.fadeIn(withDuration: 2.0)
            girl.run(fadeInAction)
        }
        
        self.backgroundColor = SKColor.background1
    }
    
    func moveClouds() {
        // Example of how to move clouds towards each other
        let moveToCloud1 = SKAction.move(to: cloud1.position, duration: 4.0)
        let moveToCloud2 = SKAction.move(to: cloud2.position, duration: 4.0)
        
        cloud1.run(moveToCloud2)
        cloud2.run(moveToCloud1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Implement touch logic, if necessary
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func update(_ currentTime: TimeInterval) {}
}
