//
//  DemoFourViewController.swift
//  iOSAnimations
//
//  Created by Ivan Corchado Ruiz on 2/5/19.
//  Copyright © 2019 ivancr. All rights reserved.
//

import UIKit

class DemoFourViewController: UIViewController {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SwiftMiamiLogo")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var sparkle: UIImageView = {
        let sparkle = UIImageView(image: UIImage(named: "sparkle")!)
        sparkle.translatesAutoresizingMaskIntoConstraints = false
        sparkle.alpha = 0
        return sparkle
    }()
    
    private lazy var chainButton: UIButton = {
        let button = UIButton()
        button.configureBasicBlueButton(title: "Animate Swift")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(chainButton)
        view.insertSubview(sparkle, belowSubview: imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 224),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            chainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            chainButton.widthAnchor.constraint(equalToConstant: 192),
            chainButton.heightAnchor.constraint(equalToConstant: 56),
            sparkle.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            sparkle.heightAnchor.constraint(equalTo: sparkle.heightAnchor),
            sparkle.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            sparkle.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            ])
    }
    
    @objc func tappedButton() {
        animate()
    }
    
    private func animate() {
        
        let originalTransform = self.imageView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.5, y: 0.5)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0, y: 128)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.imageView.transform = scaledAndTranslatedTransform
            self.imageView.alpha = 0
            
        }, completion: { _ in
            self.reset()
            self.fireworks()
        })
    }
    
    private func reset() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.8, options: .curveEaseInOut, animations: {
            self.imageView.transform = .identity
            self.imageView.alpha = 1
        })
    }
    
    private func fireworks() {
        
        let originalTransform = self.sparkle.transform
        let scaledTransform = originalTransform.scaledBy(x: 2, y: 2)
        let scaledAndTranslatedTransform = scaledTransform.rotated(by: CGFloat.pi)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.sparkle.alpha = 1
            self.sparkle.transform = scaledAndTranslatedTransform//CGAffineTransform(scaleX: 2, y: 2)
        }, completion: { _ in
            self.restoreFireworks()
        })
    }
    
    private func restoreFireworks() {
        UIView.animate(withDuration: 0.3, animations: {
            self.sparkle.alpha = 0
        })
        
        let scaledTransform = self.sparkle.transform
        
        UIView.animate(withDuration: 0.5, animations: {
            self.sparkle.transform = scaledTransform.scaledBy(x: 2, y: 2)
        }, completion: { _ in
            self.sparkle.transform = .identity
        })
    }
}
