//
//  GameScene4.swift
//  MyToys
//
//  Created by Asma Mohammed on 15/08/1446 AH.
//
import Foundation
import SpriteKit

var CloudOne: SKSpriteNode!
var CloudSecond: SKSpriteNode!
var CloudThird: SKSpriteNode!
var CloudFourth: SKSpriteNode!
var StartButton: SKSpriteNode!


class GameScene4: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // جلب الغيوم من المشهد
        CloudOne = self.childNode(withName: "CloudOne") as? SKSpriteNode
        CloudSecond = self.childNode(withName: "cloudSecond") as? SKSpriteNode
        CloudThird = self.childNode(withName: "cloudThird") as? SKSpriteNode
        CloudFourth = self.childNode(withName: "cloudFourth") as? SKSpriteNode
        StartButton = self.childNode(withName: "StartButton") as? SKSpriteNode
        if let startButton = StartButton {
                addPulsingAnimation(to: startButton)
        // التحقق إذا كانت الغيوم موجودة
    }
        func addPulsingAnimation(to node: SKNode) {
            node.setScale(1.0) // تأكيد أن العقدة تبدأ بالحجم الأصلي
            let scaleDown = SKAction.scale(to: 0.8, duration: 0.6) // تصغير الحجم إلى 80% من الحجم الأصلي
            let scaleUp = SKAction.scale(to: 1.0, duration: 0.6) // العودة إلى الحجم الأصلي
            let pulse = SKAction.sequence([scaleDown, scaleUp]) // إنشاء تسلسل من الأكشنات
            let repeatPulse = SKAction.repeatForever(pulse) // تكرار الأنيميشن للأبد
            node.run(repeatPulse) // تطبيق الأنيميشن على العقدة
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let StartButton = self.atPoint(location)
            
            // التحقق إذا تم الضغط على الزر
            if StartButton.name == "StartButton" {
                // تشغيل الصوت عند الضغط على الزر
              
                
                // الانتقال إلى المشهد التالي
                goToNextScene()
            }
        }
    }

    func goToNextScene() {
        if let nextScene = SKScene(fileNamed: "GameScene5") {
            nextScene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0) // يمكنك تغيير التأثير هنا
            self.view?.presentScene(nextScene, transition: transition)
        }
    }

    
    
    
    
    
        }

