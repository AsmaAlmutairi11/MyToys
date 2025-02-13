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
var cloud: SKSpriteNode!
var basket: SKSpriteNode!
var herp: SKSpriteNode!
var BearNormal: SKSpriteNode!
var PuzzleNormal: SKSpriteNode!
var trainNormal: SKSpriteNode!
var giraffeNormal: SKSpriteNode!
var rocket: SKSpriteNode!
var TextBackground1: SKSpriteNode!
var Lebal1: SKLabelNode!

class GameScene2: SKScene {
    
    
    ///g
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        if let Lebal = self.childNode(withName: "Lebal") as? SKLabelNode {
            Lebal.fontName = "MarkerFelt-Wide"
            Lebal.text = "Put all these toys\nin this basket"
            Lebal.fontSize = 24
            Lebal.horizontalAlignmentMode = .center
            Lebal.verticalAlignmentMode = .center
            Lebal.preferredMaxLayoutWidth = 300
            Lebal.numberOfLines = 0
        }
    }
}

    
    
    
    
        

