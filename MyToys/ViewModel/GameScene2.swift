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
            moveCloud2()
        }
        button2 = self.childNode(withName: "button2") as? SKSpriteNode
        herp = self.childNode(withName: "herp") as? SKSpriteNode
        TextBackground1 = self.childNode(withName: "TextBackground1") as? SKSpriteNode
        trainNormal = self.childNode(withName: "trainNormal") as? SKSpriteNode
        rocket = self.childNode(withName: "rocket") as? SKSpriteNode
        giraffeNormal = self.childNode(withName: "giraffeNormal") as? SKSpriteNode
        PuzzleNormal = self.childNode(withName: "PuzzleNormal") as? SKSpriteNode
        BearNormal = self.childNode(withName: "BearNormal") as? SKSpriteNode
        basket = self.childNode(withName: "basket") as? SKSpriteNode
        girl = self.childNode(withName: "girl") as? SKSpriteNode
   
        
        if let Lebal = self.childNode(withName: "Lebal1") as? SKLabelNode {
            Lebal.fontName = "MarkerFelt-Wide"
            Lebal.text = "Put all these toys\nin this basket"
            Lebal.fontSize = 24
            Lebal.horizontalAlignmentMode = .center
            Lebal.verticalAlignmentMode = .center
            Lebal.preferredMaxLayoutWidth = 300
            Lebal.numberOfLines = 0
        }
        self.backgroundColor = SKColor.background1
    }
    

    func moveCloud2() {
        let moveLeft = SKAction.moveBy(x: -400, y: 0, duration: 6.0) // تحرك 400 نقطة لليسار خلال 6 ثوانٍ
        let resetPosition = SKAction.moveBy(x: 400, y: 0, duration: 0) // ترجع إلى البداية فورًا
        let sequence = SKAction.sequence([moveLeft, resetPosition]) // ترتيب الحركة
        let repeatForever = SKAction.repeatForever(sequence) // تكرار مستمر
        
        cloud2.run(repeatForever) // تشغيل الحركة
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            // التأكد من أن الزر مرئي وداخل المنطقة
            if button2.contains(location) && button2.alpha == 1.0 {
                handleButtonPress()
            }
        }
    }

    func handleButtonPress() {
        // إضافة تأثير النبض
        let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)
        let scaleNormal = SKAction.scale(to: 1.0, duration: 0.1)
        let pulseSequence = SKAction.sequence([scaleDown, scaleUp, scaleNormal])

        // التأكد من تنفيذ التأثير أولًا ثم الانتقال
        button2.run(pulseSequence) {
            // الانتقال إلى المشهد التالي بعد اكتمال التأثير
            self.goToNextScene()
        }
    }


    func goToNextScene() {
        if let nextScene = SKScene(fileNamed: "GameScene3") {
            nextScene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0) // يمكنك تغيير التأثير هنا
            self.view?.presentScene(nextScene, transition: transition)
        }
    }

   
}

    
    
    
    
        

