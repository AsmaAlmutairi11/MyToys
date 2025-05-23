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
        herp = self.childNode(withName: "herp") as? SKSpriteNode
        TextBackground1 = self.childNode(withName: "TextBackground1") as? SKSpriteNode
        trainNormal = self.childNode(withName: "trainNormal") as? SKSpriteNode
        rocket = self.childNode(withName: "rocket") as? SKSpriteNode
        giraffeNormal = self.childNode(withName: "giraffeNormal") as? SKSpriteNode
        PuzzleNormal = self.childNode(withName: "PuzzleNormal") as? SKSpriteNode
        BearNormal = self.childNode(withName: "BearNormal") as? SKSpriteNode
        basket = self.childNode(withName: "basket") as? SKSpriteNode
        
        
        
   
        
        if let Lebal = self.childNode(withName: "Lebal") as? SKLabelNode {
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
    
    func moveClouds() {
        // Example of how to move clouds towards each other
        let moveToCloud = SKAction.move(to: cloud2.position, duration: 4.0)
      
        
        cloud2.run(moveToCloud)

    }
}

    
    
    
    
        

