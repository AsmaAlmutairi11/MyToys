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
    var Butterfly2: SKSpriteNode!
    var button: SKSpriteNode!
    var touchLocation = CGPoint()
    var hero = SKSpriteNode()
    var Lebal1 = SKLabelNode()
    var Lebal2  = SKLabelNode()
    var Lebal3  = SKLabelNode()
    var home = SKSpriteNode()
    var homeNormal = SKSpriteNode()
    var NextButton = SKSpriteNode()
    
    var currentStep = 0
    
    override func didMove(to view: SKView) {
        // Load nodes from the scene (assuming these nodes exist in your .sks file)
        
        if let label1 = self.childNode(withName: "Lebal1") as? SKLabelNode {
            Lebal1 = label1
            Lebal1.fontName = "MarkerFelt-Wide"
            Lebal1.text = "        This is Elsa\nA child with a vision\n        Disability\n She has colorblindness"
            Lebal1.fontSize = 24
            Lebal1.horizontalAlignmentMode = .center
            Lebal1.verticalAlignmentMode = .center
            Lebal1.preferredMaxLayoutWidth = 300
            Lebal1.numberOfLines = 0
            Lebal1.run(SKAction.fadeIn(withDuration: 1.0))
            Lebal1.alpha = 0
            
        }
        
        if let label2 = self.childNode(withName: "Lebal2") as? SKLabelNode {
            Lebal2 = label2
            Lebal2.fontName = "MarkerFelt-Wide"
            Lebal2.text = "     She needs help to collect\n                   her toys"
            Lebal2.fontSize = 24
            Lebal2.horizontalAlignmentMode = .center
            Lebal2.verticalAlignmentMode = .center
            Lebal2.preferredMaxLayoutWidth = 300
            Lebal2.numberOfLines = 0
        }
        
        if let label3 = self.childNode(withName: "Lebal3") as? SKLabelNode {
            Lebal3 = label3
            Lebal3.fontName = "MarkerFelt-Wide"
            Lebal3.text = "this how she could see\n her yoys"
            Lebal3.fontSize = 24
            Lebal3.horizontalAlignmentMode = .center
        }
        
        Lebal2.alpha = 0
        Lebal3.alpha = 0
        NextButton = (self.childNode(withName: "NextButton") as? SKSpriteNode)!
        
        home = (self.childNode(withName: "home") as? SKSpriteNode)!
        homeNormal = (self.childNode(withName: "homeNormal") as? SKSpriteNode)!
        button = self.childNode(withName: "button") as? SKSpriteNode
        girl = self.childNode(withName: "girl") as? SKSpriteNode
        cloud1 = self.childNode(withName: "cloud1") as? SKSpriteNode
        cloud2 = self.childNode(withName: "cloud2") as? SKSpriteNode
        Butterfly2 = self.childNode(withName: "butterfly2") as? SKSpriteNode
        Butterfly1 = self.childNode(withName: "Butterfly1") as? SKSpriteNode
        NextButton = (self.childNode(withName: "NextButton") as? SKSpriteNode)!
        // Hide the NextButton initially
        NextButton.alpha = 0
        
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
        
        Lebal1.alpha = 0
        Lebal2.alpha = 0
        Lebal3.alpha = 0
        home.alpha = 0
        homeNormal.alpha = 0
    }
    
    func moveClouds() {
        // Example of how to move clouds towards each other
        let moveToCloud1 = SKAction.move(to: cloud1.position, duration: 4.0)
        let moveToCloud2 = SKAction.move(to: cloud2.position, duration: 4.0)
        
        cloud1.run(moveToCloud2)
        cloud2.run(moveToCloud1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            // تحقق من الضغط على NextButton فقط إذا كان مرئي
            if NextButton.contains(location) && NextButton.alpha == 1.0 {
                // إضافة تأثير تصغير وتكبير ل NextButton
                let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)  // تصغير الزر
                let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)    // تكبير الزر
                let scaleNormal = SKAction.scale(to: 1.0, duration: 0.1) // إعادة الزر إلى حجمه الطبيعي
            
                let pulseSequence = SKAction.sequence([scaleDown, scaleUp, scaleNormal])
                NextButton.run(pulseSequence)
                
                // الانتقال إلى المشهد التالي بعد التأثير
                goToNextScene()  // الانتقال إلى المشهد التالي
            } else if button.contains(location) {
                // نفس التأثير على الزر الأول (button)
                let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)  // تصغير الزر
                let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)    // تكبير الزر
                let scaleNormal = SKAction.scale(to: 1.0, duration: 0.1) // إعادة الزر إلى حجمه الطبيعي
                
                let pulseSequence = SKAction.sequence([scaleDown, scaleUp, scaleNormal])
                button.run(pulseSequence)
                
                switch currentStep {
                case 0:
                    // إخفاء Label1 وإظهار Label2
                    Lebal1.run(SKAction.fadeOut(withDuration: 0.5))
                    Lebal2.run(SKAction.fadeIn(withDuration: 0.5))
                    currentStep = 1
                case 1:
                    // إخفاء Label2 وإظهار Label3
                    Lebal2.run(SKAction.fadeOut(withDuration: 0.5))
                    Lebal3.run(SKAction.fadeIn(withDuration: 0.5))
                    currentStep = 2
                    home.run(SKAction.fadeIn(withDuration: 0.5))
                    homeNormal.run(SKAction.fadeIn(withDuration: 0.5))
                    
                    // إخفاء الزر الأول (button)
                    button.run(SKAction.fadeOut(withDuration: 0.5))
                    
                    // إضافة تأخير قبل ظهور NextButton
                    let delay = SKAction.wait(forDuration: 0.3)  // تأخير لمدة 0.3 ثانية
                    let fadeInNextButton = SKAction.fadeIn(withDuration: 1.0)  // ظهور تدريجي لمدة 1 ثانية
                    
                    let sequence = SKAction.sequence([delay, fadeInNextButton])  // دمج التأخير مع التأثير
                    NextButton.run(sequence)  // تنفيذ التأثير
                    
                default:
                    break
                }
            }
        }
    }





    private func goToNextScene() {
        if let view = self.view {
            let transition = SKTransition.fade(withDuration: 1.0)  // استخدام تأثير fade أثناء الانتقال
            let scene = GameScene2(size: view.bounds.size)  // أنشئ مشهد GameScene2 بنفس حجم الشاشة
            view.presentScene(scene, transition: transition)  // انتقل إلى المشهد الجديد مع الانتقال
        }
    }


    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func update(_ currentTime: TimeInterval) {}
}
