//
//  DemoTwoViewController.swift
//  iOSAnimations
//
//  Created by Ivan Corchado Ruiz on 2/4/19.
//  Copyright © 2019 ivancr. All rights reserved.
//

import UIKit

class DemoTwoViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var button2: UIButton!
    
    lazy var shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let bounds = CGRect(x: button.center.x - 100, y: 112, width: 200, height: 64)
        layer.path = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: .allCorners,
                                  cornerRadii: CGSize(width: 10, height: 10)).cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.lineDashPattern = [8, 6]
        return layer
    }()
    
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(updateText))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        view.layer.addSublayer(shapeLayer)
        button.configureBasicWhiteButton(title: "Animate Shape")
        button2.configureBasicWhiteButton(title: "Animate Text")
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 44, weight: .black)
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        shapeLayer.add(animation, forKey: "line")
    }
    
    
    @IBAction func tappedButton2(_ sender: Any) {
        displayLink.add(to: .main, forMode: .default)
    }
    
    var startValue = 0
    let endValue = 500
    
    @objc func updateText() {
        label.text = String(startValue)
        startValue += 1
        
        if startValue > endValue {
            startValue = 0
            label.text = "0"
            displayLink.remove(from: .main, forMode: .default)
        }
    }
}

extension DemoTwoViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            textField.shake()
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        if newLength > 10 {
            textField.shake()
            return false
        }
        return true
    }
}

//MARK: UIView Extensions
public extension UIView {
    func shake() {
        let keypath = "position"
        let animation = CABasicAnimation(keyPath: keypath)
        animation.duration = 0.2
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.speed = 4
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 6, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 6, y: self.center.y))
        layer.add(animation, forKey: keypath)
    }
}
