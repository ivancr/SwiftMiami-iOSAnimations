//
//  DemoFiveViewController.swift
//  iOSAnimations
//
//  Created by Ivan Corchado Ruiz on 2/6/19.
//  Copyright © 2019 ivancr. All rights reserved.
//

import UIKit
import SpriteKit

class DemoFiveViewController: UIViewController {

    @IBOutlet var spriteView: SKView!
    @IBOutlet var button: UIButton!
    
    lazy var scene: SKScene = {
        let scene = SKScene(size: view.bounds.size)
        scene.backgroundColor = .white
        return scene
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spriteView.presentScene(scene)
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        animateButton()
    }
    
    private func animateButton() {
        
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { _ in
            self.explode()
            self.throwBirds()
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
                
                self.button.transform = .identity
            })
        })
    }
    
    private func explode() {
        let explosion = SKEmitterNode(fileNamed: "explosion.sks")!
        explosion.position = view.center
        scene.addChild(explosion)
    }
    
    private func throwBirds() {
        let swiftBirds = SKEmitterNode(fileNamed: "swiftBirds.sks")!
        swiftBirds.position = CGPoint(x: view.center.x, y: view.frame.maxY * 0.65)
        scene.addChild(swiftBirds)
    }
}
