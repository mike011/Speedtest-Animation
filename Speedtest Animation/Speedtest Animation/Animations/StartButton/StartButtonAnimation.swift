//
//  StartButtonAnimation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-21.
//

import SpriteKit

class StartButtonAnimation: Animation {

    private let scene: SKScene!
    private let button: UIButton

    init(view: SKView, button: UIButton) {
        self.scene = Self.createScene(fromView: view)
        self.button = button
    }

    private static func createScene(fromView view: SKView) -> SKScene {
        let scene = SKScene(fileNamed: "StartButton")!
        view.presentScene(scene)
        scene.backgroundColor = .clear
        return scene
    }

    func start() {
        button.isHidden = true
        let action = SKAction.animate(with: getTextures(), timePerFrame: 0.04)
        let animation = SKSpriteNode(imageNamed: "1.png")
        animation.run(action)
        scene.addChild(animation)
    }

    private func getTextures() -> [SKTexture] {
        var result = [SKTexture]()
        for i in 1...7 {
            result.append(SKTexture(imageNamed: "\(i).png"))
        }
        return result
    }

    func finish() {
        scene.removeAllChildren()
    }
}
