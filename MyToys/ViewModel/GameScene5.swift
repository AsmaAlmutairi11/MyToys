//
//  GameScene5.swift
//  MyToys
//
//  Created by Asma Mohammed on 15/08/1446 AH.
//
import Foundation
import SpriteKit

var Cloud5: SKSpriteNode!
var Cloud6: SKSpriteNode!
var basket5: SKSpriteNode!
var box5: SKSpriteNode!
var BearNormal5: SKSpriteNode!
var cubes: SKSpriteNode!
var duckNormal: SKSpriteNode!
var home: SKSpriteNode!
var rocket1: SKSpriteNode!
var trainNormal1: SKSpriteNode!
var giraffeNormal1: SKSpriteNode!
var touchLocation = CGPoint()

class GameScene5: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // Force unwrap, assuming nodes exist in the scene
        Cloud5 = self.childNode(withName: "Cloud5") as? SKSpriteNode
        Cloud6 = self.childNode(withName: "Cloud6") as? SKSpriteNode
        basket5 = self.childNode(withName: "basket5") as? SKSpriteNode
        
        // Ensure basket5 is added only once
        if basket5 == nil {
                   basket5 = SKSpriteNode(imageNamed: "basketImage") // استبدل "basketImage" بالصورة المناسبة
                   basket5.name = "basket5"
                   basket5.position = CGPoint(x: self.size.width / 2, y: basket5.size.height / 2) // وضع السلة في الأسفل
                   self.addChild(basket5)
               }
        
        box5 = self.childNode(withName: "box5") as? SKSpriteNode
        BearNormal5 = self.childNode(withName: "BearNormal5") as? SKSpriteNode
        cubes = self.childNode(withName: "cubes") as? SKSpriteNode
        duckNormal = self.childNode(withName: "duckNormal") as? SKSpriteNode
        home = self.childNode(withName: "home") as? SKSpriteNode
        rocket1 = self.childNode(withName: "rocket1") as? SKSpriteNode
        trainNormal1 = self.childNode(withName: "trainNormal1") as? SKSpriteNode
        giraffeNormal1 = self.childNode(withName: "giraffeNormal1") as? SKSpriteNode
        if let giraffeNormal1 = giraffeNormal1, giraffeNormal1.parent != nil {
                  giraffeNormal1.removeFromParent()
              }
        if giraffeNormal1 == nil {
              giraffeNormal1 = SKSpriteNode(imageNamed: "giraffeNormal") // استخدم الصورة المناسبة هنا
              giraffeNormal1.name = "giraffeNormal1"
              giraffeNormal1.position = CGPoint(x: self.size.width / 2, y: self.size.height) // وضعها في الأعلى
              self.addChild(giraffeNormal1)
              
              // إعداد الجسم الفيزيائي للزرافة
              giraffeNormal1.physicsBody = SKPhysicsBody(rectangleOf: giraffeNormal1.size)
              giraffeNormal1.physicsBody?.affectedByGravity = true
              giraffeNormal1.physicsBody?.isDynamic = true
          }
        
        
        self.backgroundColor = SKColor.background1
    }

    // Handle touch interactions
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            // التأكد من أن السلة تتحرك فقط أفقيًا
            var newX = touchLocation.x
            
            // إبقاء السلة ضمن حدود الشاشة
            newX = max(basket5.size.width / 2, newX)
            newX = min(self.size.width - basket5.size.width / 2, newX)
            
            basket5.position.x = newX
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            var newX = touchLocation.x
            
            // إبقاء السلة ضمن حدود الشاشة
            newX = max(basket5.size.width / 2, newX)
            newX = min(self.size.width - basket5.size.width / 2, newX)
            
            basket5.position.x = newX
        }
    }
}
