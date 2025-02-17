//
//  GameScene3.swift
//  MyToys
//
//  Created by Asma Mohammed on 14/08/1446 AH.
//

import Foundation
import SpriteKit

var girl3 = SKSpriteNode()
var herp3 = SKSpriteNode()
var cloud3 = SKSpriteNode()
var TextBackGround = SKSpriteNode()
var buterfly3 = SKSpriteNode()
var Lebal3 = SKLabelNode()
var ButtonLetsPlay = SKSpriteNode()







class GameScene3: SKScene {
    
    
    
    override func didMove(to view: SKView) {
            
        girl3 = self.childNode(withName: "girl3") as! SKSpriteNode
        herp3 = self.childNode(withName: "herp3") as! SKSpriteNode
        cloud3 = self.childNode(withName: "cloud3") as! SKSpriteNode
        TextBackGround = self.childNode(withName: "TextBackGround") as! SKSpriteNode
        buterfly3 = self.childNode(withName: "buterfly3") as! SKSpriteNode
        
        
        Lebal3  = self.childNode(withName: "Lebal3") as! SKLabelNode
        
        
        if let Lebal3 = self.childNode(withName: "Lebal3") as? SKLabelNode {
            Lebal3.fontName = "MarkerFelt-Wide"
            Lebal3.text = "this how she could see\n her yoys"
            Lebal3.fontSize = 24
            Lebal3.horizontalAlignmentMode = .center
        }
        
        ButtonLetsPlay  = self.childNode(withName: "ButtonLetsPlay") as! SKSpriteNode
        
        
        }
    
    
    
    
}
