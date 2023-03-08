//
//  ViewController.swift
//  SliderAnimate
//
//  Created by Эллина Коржова on 9.03.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var slider: UISlider!

    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
        animationView.layer.cornerRadius = 10
        animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            self.animationView.transform = CGAffineTransform(rotationAngle: (.pi) / 2).scaledBy(x: 1.5, y: 1.5)
            self.animationView.frame = self.animationView.frame.offsetBy(dx: self.view.frame.width - self.animationView.frame.width - self.view.layoutMargins.right, dy: 0)
            self.animator.pausesOnCompletion = true
        })
    }
    
    func setConstraints(){
        let marginsGuide = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: marginsGuide.topAnchor, constant: 50),
        animationView.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 70),
            animationView.widthAnchor.constraint(equalTo: animationView.heightAnchor),
    
            slider.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 50),
            slider.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: marginsGuide.trailingAnchor),
            ])
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value) / 100
    }
    
    @IBAction func releaseSlider(_ sender: UISlider) {
        if animator.isRunning {
            slider.value = Float(animator.fractionComplete)
        }
        slider.setValue(slider.maximumValue, animated: true)
        animator.startAnimation()
    }
}
