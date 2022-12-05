//
//  CustomTapBar.swift
//  GEELY
//
//  Created by Tuqa on 11/22/22.
//
import SwiftUI
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setUpMiddButton()
    }
    // MARK: - Creat a costum Button
    func setUpMiddButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        //costum a gradient color
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(named: "Blue")!.cgColor, UIColor(named: "Violet")!.cgColor]
        gradient.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        gradient.startPoint = CGPoint(x: 1.7, y: -0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.5)
        gradient.cornerRadius = 35
        button.layer.insertSublayer(gradient, at: 0)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 35
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 5
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        button.setTitle("24/7", for: .normal)
        let consntrate = [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 70),
        ]
        NSLayoutConstraint.activate(consntrate)
        button.addTarget(self, action: #selector(midddButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    
    @objc func midddButtonAction(sender: UIButton) {
        self.animateButton(sender)
        
    }
    
    // MARK: - Button Animation method
    fileprivate func animateButton(_ animate: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            animate.transform = CGAffineTransform(scaleX: 0.92, y: 0.9)
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2,options: .curveEaseIn, animations:  {
                animate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}
    
   


