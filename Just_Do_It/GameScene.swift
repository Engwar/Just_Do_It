//
//  GameScene.swift
//  Just_Do_It
//
//  Created by Igor Shelginskiy on 11/2/19.
//  Copyright © 2019 Igor Shelginskiy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

	//Texture
	var bgTexture = SKTexture()
	var coinTexture = SKTexture()

	//SpriteNodes
	var bg = SKSpriteNode()
	var coin = SKSpriteNode()

	//Sprite Objects
	var bgObject = SKNode()
	var coinObject = SKNode()

	//Texture array for animate
	var coinTextureArray = [SKTexture]()

	override func didMove(to view: SKView) {
		bgTexture = SKTexture(imageNamed: "bg0.png")
		coinTexture = SKTexture(imageNamed: "goldCoin1.png")
		self.addChild(bgObject)
		self.addChild(coinObject)
		createBg()
		addCoin(coinNode: coin, position: CGPoint(x: self.size.width/12, y: coinTexture.size().height ))
		addCoin(coinNode: coin, position: CGPoint(x: self.size.width/20, y: coinTexture.size().height ))
		addCoin(coinNode: coin, position: CGPoint(x: self.size.width/4, y: coinTexture.size().height ))
		addCoin(coinNode: coin, position: CGPoint(x: self.size.width/8, y: coinTexture.size().height ))
	}

	func createBg () {

		//двигаем бэкграунд (минус значит двигаем влево)
		let moveBg = SKAction.moveBy(x: -bgTexture.size().width, y: 0, duration: 3)
		let replaceBg = SKAction.moveBy(x: bgTexture.size().width, y: 0, duration: 0)
		let moveBgForever = SKAction.repeatForever(SKAction.sequence([moveBg, replaceBg]))

		//создаем текстуру
		for i in 0..<3 {
			bg = SKSpriteNode(texture: bgTexture)
			bg.position = .init(x: size.width/4 + bgTexture.size().width * CGFloat(i), y: 0)
			bg.size.height = self.frame.height
			bg.run(moveBgForever)
			bg.zPosition = -1
			bgObject.addChild(bg)
		}
	}

	func addCoin(coinNode: SKSpriteNode, position: CGPoint) {
		coin = SKSpriteNode(texture: coinTexture)

		coinTextureArray = [SKTexture(imageNamed: "goldCoin1.png"), SKTexture(imageNamed: "goldCoin2.png"), SKTexture(imageNamed: "goldCoin3.png"), SKTexture(imageNamed: "goldCoin4.png"), SKTexture(imageNamed: "goldCoin5.png"), SKTexture(imageNamed: "goldCoin6.png"), SKTexture(imageNamed: "goldCoin7.png"), SKTexture(imageNamed: "goldCoin8.png"), SKTexture(imageNamed: "goldCoin9.png")]

		let coinSpin = SKAction.animate(with: coinTextureArray, timePerFrame: 0.1)
		let coinAnimate = SKAction.repeatForever(coinSpin)
		coin.run(coinAnimate)
		coin.position = position
		coinObject.addChild(coin)
	}
}
