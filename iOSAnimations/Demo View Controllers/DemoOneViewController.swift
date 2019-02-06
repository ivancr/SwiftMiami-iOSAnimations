//
//  DemoOneViewController.swift
//  iOSAnimations
//
//  Created by Ivan Corchado Ruiz on 2/2/19.
//  Copyright © 2019 ivancr. All rights reserved.
//

import UIKit

class DemoOneViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var label: UILabel!
    
    let effect = UIBlurEffect(style: .light)
    private lazy var blurView = UIVisualEffectView(effect: effect)
    
    @IBOutlet var labelCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button1.configureBasicBlueButton(title: "Basic Animation")
        button2.configureBasicBlueButton(title: "EaseOut Animation")
        button3.configureBasicBlueButton(title: "Spring Animation")
        button4.configureBasicBlueButton(title: "Blur Animation")
        resetToInitialState()
        view.insertSubview(blurView, belowSubview: resetButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        blurView.frame = view.bounds
    }
    
    private func showLabel() {
        label.alpha = 1
        labelCenterConstraint.constant = 0
        view.layoutIfNeeded()
    }
    
    private func resetToInitialState() {
        labelCenterConstraint.constant = -view.bounds.width
        label.alpha = 0
        blurView.effect = nil
        blurView.isHidden = true
    }
    
    @IBAction func tappedButton1(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.showLabel()
        }
    }
    
    @IBAction func tappedButton2(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.showLabel()
        }, completion: nil)
    }
    
    @IBAction func tappedButton3(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.showLabel()
        }, completion: nil)
    }
    
    @IBAction func tappedButton4(_ sender: Any) {
        blurView.isHidden = false
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.blurView.effect = self.effect
        }, completion: nil)
    }
    
    @IBAction func tappedResetButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.label.alpha = 0
            
        }, completion: { _ in
            self.resetToInitialState()
        })
    }
}
