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
var butterfly10: SKSpriteNode!

class GameScene4: SKScene {

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        CloudOne = self.childNode(withName: "CloudOne") as? SKSpriteNode
        CloudSecond = self.childNode(withName: "cloudSecond") as? SKSpriteNode
        CloudThird = self.childNode(withName: "cloudThird") as? SKSpriteNode
        CloudFourth = self.childNode(withName: "cloudFourth") as? SKSpriteNode
        StartButton = self.childNode(withName: "StartButton") as? SKSpriteNode
        
        self.backgroundColor = SKColor.background1

        // تشغيل تأثير النبض على الزر
        addPulsingAnimation(to: StartButton)
    }
    
    func addPulsingAnimation(to node: SKNode?) {
        guard let node = node else { return } // تأكد أن الزر موجود
        node.setScale(1.0)
        let scaleDown = SKAction.scale(to: 0.9, duration: 1.2)
        let scaleUp = SKAction.scale(to: 1.0, duration: 1.2)
        let pulse = SKAction.sequence([scaleDown, scaleUp])
        let repeatPulse = SKAction.repeatForever(pulse)
        node.run(repeatPulse)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let button = StartButton, button.contains(location) {
                goToGameScene5()
            }
        }
    }

    func goToGameScene5() {
        if let scene = GameScene5(fileNamed: "GameScene5") {
            scene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0) // تأثير انتقال ناعم
            self.view?.presentScene(scene, transition: transition)
        }
    }
}
