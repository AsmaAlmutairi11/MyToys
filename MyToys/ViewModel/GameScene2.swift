//
//  GameScene2.swift
//  MyToys
//
//  Created by Asma Mohammed on 14/08/1446 AH.
//

import Foundation
import SpriteKit
import GameplayKit

var girl: SKSpriteNode!
var cloud2: SKSpriteNode!
var basket: SKSpriteNode!
var herp: SKSpriteNode!
var BearNormal: SKSpriteNode!
var PuzzleNormal: SKSpriteNode!
var trainNormal: SKSpriteNode!
var giraffeNormal: SKSpriteNode!
var rocket: SKSpriteNode!
var TextBackground1: SKSpriteNode!
var Lebal1: SKLabelNode!
var button2: SKSpriteNode!

class GameScene2: SKScene {
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        cloud2 = self.childNode(withName: "cloud2") as? SKSpriteNode
        if cloud2 != nil {
            moveClouds()
        }
        button2 = self.childNode(withName: "button2") as? SKSpriteNode
        
        // لا تستدعي goToNextScene هنا لأننا نريد الانتقال فقط عند الضغط على الزر
        herp = self.childNode(withName: "herp") as? SKSpriteNode
        TextBackground1 = self.childNode(withName: "TextBackground1") as? SKSpriteNode
        trainNormal = self.childNode(withName: "trainNormal") as? SKSpriteNode
        rocket = self.childNode(withName: "rocket") as? SKSpriteNode
        giraffeNormal = self.childNode(withName: "giraffeNormal") as? SKSpriteNode
        PuzzleNormal = self.childNode(withName: "PuzzleNormal") as? SKSpriteNode
        BearNormal = self.childNode(withName: "BearNormal") as? SKSpriteNode
        basket = self.childNode(withName: "basket") as? SKSpriteNode
        
        if let Lebal1 = self.childNode(withName: "Lebal1") as? SKLabelNode {
            Lebal1.fontName = "MarkerFelt-Wide"
            Lebal1.text = "      Help Elsa to collect\nher toys in this basket"
            Lebal1.fontSize = 24
            Lebal1.horizontalAlignmentMode = .center
            Lebal1.verticalAlignmentMode = .center
            Lebal1.preferredMaxLayoutWidth = 300
            Lebal1.numberOfLines = 0
        }
        self.backgroundColor = SKColor.background1
    }
    
    
    private func goToNextScene() {
        if let nextScene = SKScene(fileNamed: "GameScene3") {
            nextScene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0) // تأثير الانتقال
            self.view?.presentScene(nextScene, transition: transition)
        }
    }
    
    func moveClouds() {
        // Example of how to move clouds towards each other
        let moveToCloud = SKAction.move(to: cloud2.position, duration: 4.0)
        cloud2.run(moveToCloud)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if button2.contains(location) {
                let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)  // تصغير الزر
                let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)    // تكبير الزر
                let scaleNormal = SKAction.scale(to: 1.0, duration: 0.1) // إعادة الزر إلى حجمه الطبيعي
                
                let pulseSequence = SKAction.sequence([scaleDown, scaleUp, scaleNormal])
                button2.run(pulseSequence)
                
                goToNextScene()  // الانتقال إلى المشهد التالي بعد الضغط على الزر
            }
        }
    }
}
