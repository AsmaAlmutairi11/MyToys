//
//  GameScene3.swift
//  MyToys
//
//  Created by Asma Mohammed on 14/08/1446 AH.
//
import Foundation
import SpriteKit

var girl33: SKSpriteNode!
var herp3: SKSpriteNode!
var cloud3: SKSpriteNode!
var textBackGround: SKSpriteNode!
var butterfly3: SKSpriteNode!
var label3: SKLabelNode!
var button3: SKSpriteNode!

class GameScene3: SKScene {
    
    override func didMove(to view: SKView) {
        // جلب العقد
        girl33 = self.childNode(withName: "girl33") as? SKSpriteNode
        herp3 = self.childNode(withName: "herp3") as? SKSpriteNode
        cloud3 = self.childNode(withName: "cloud3") as? SKSpriteNode
        textBackGround = self.childNode(withName: "TextBackGround") as? SKSpriteNode
        butterfly3 = self.childNode(withName: "butterfly3") as? SKSpriteNode
        button3 = self.childNode(withName: "button3") as? SKSpriteNode

        label3 = self.childNode(withName: "label3") as? SKLabelNode
        label3?.fontName = "MarkerFelt-Wide"
        label3?.text = "Ready to play?"
        label3?.fontSize = 24
        label3?.horizontalAlignmentMode = .center
        
        self.backgroundColor = SKColor.background1 // تم إصلاح الخطأ في backgroundColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            // تأكد من أن button3 ليس nil قبل استخدامه
            if let button3 = button3, button3.contains(location) {
                let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)  // تصغير الزر
                let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)    // تكبير الزر
                let scaleNormal = SKAction.scale(to: 1.0, duration: 0.1) // إعادة الزر إلى حجمه الطبيعي
                
                let pulseSequence = SKAction.sequence([scaleDown, scaleUp, scaleNormal])
                button3.run(pulseSequence)
                
                goToNextScene()
            }
        }
    }
    
    private func goToNextScene() {
        if let nextScene = GameScene4(fileNamed: "GameScene4") {
            nextScene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0) // تأثير الانتقال
            self.view?.presentScene(nextScene, transition: transition)
        }
    }
}
