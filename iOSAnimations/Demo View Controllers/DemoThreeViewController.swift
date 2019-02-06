//
//  DemoThreeViewController.swift
//  iOSAnimations
//
//  Created by Ivan Corchado Ruiz on 2/4/19.
//  Copyright © 2019 ivancr. All rights reserved.
//

import UIKit

class DemoThreeViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    var emitter = CAEmitterLayer()
    var velocities: [CGFloat] = [100, 90, 150, 200]
    let images = [UIImage(named: "Green 1")!.cgImage,
                  UIImage(named: "Green 2")!.cgImage,
                  UIImage(named: "Green 3")!.cgImage,
                  UIImage(named: "Purple 1")!.cgImage,
                  UIImage(named: "Purple 2")!.cgImage,
                  UIImage(named: "Purple 3")!.cgImage]
    
    
    override func viewDidLoad() {
        button.configureBasicBlueButton(title: "Make it Rain ☂️")
        button.layer.cornerRadius = button.bounds.height / 2
    }
    
    private func generateEmitterCells() -> [CAEmitterCell] {
        var cells: [CAEmitterCell] = []

        for _ in 0...16 {
            cells.append(confetti())
        }

        return cells
    }
    
    var timer = Timer()
    
    @IBAction func tappedButton(_ sender: UIButton) {
        timer.invalidate()
        startParticles()
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.stopParticles()
        }
    }
    
    func startParticles() {
        emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: view.center.x, y: -10)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        emitter.emitterCells = generateEmitterCells()
        emitter.beginTime = CACurrentMediaTime()
        view.layer.insertSublayer(emitter, below: button.layer)
    }
    
    func stopParticles() {
        emitter.birthRate = 0
    }
    
    func confetti() -> CAEmitterCell {
        let confetti = CAEmitterCell()
        confetti.birthRate = 8.0
        confetti.lifetime = 14.0
        confetti.lifetimeRange = 0
        confetti.velocity = velocities.randomElement()!
        confetti.velocityRange = 0
        confetti.emissionLongitude = CGFloat(Double.pi)
        confetti.emissionRange = 0.5
        confetti.spin = 3.5
        confetti.spinRange = 0
        confetti.contents = images.randomElement()!
        confetti.scaleRange = 0.25
        confetti.scale = 0.1
        
        return confetti
    }
}



