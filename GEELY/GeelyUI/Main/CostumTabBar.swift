//
//  TabBarVC.swift
//  GEELY
//
//  Created by Tuqa on 11/22/22.
//

import UIKit

class costumTabBar: UITabBar {
    
    // MARK: - shape method..dealing with layers of the Tab Bar
    private var shapelayer: CALayer?
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.quaternarySystemFill.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.shadowOffset = CGSize(width: 0, height: -10)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 40
        if let oldShapeLayer = self.shapelayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        }
        else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapelayer = shapeLayer
        
    }
    // MARK: - View, draw, update the shape
    override func draw(_ rect: CGRect) {
        self.addShape()
        self.unselectedItemTintColor = unselectedItemTintColor
        self.tintColor = UIColor.black
    }
    
    // MARK: - creat a path method to make a curve Tab Bar
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let centerWidth = frame.width/2.0
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0)) // start position
        // left slope/line
        path.addLine(to: CGPoint(x: centerWidth - height * 2, y: 0))
        // left curve
        path.addCurve(to: CGPoint(x: centerWidth, y: height), controlPoint1: CGPoint(x: centerWidth - 30, y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        // right curve
        path.addCurve(to: CGPoint(x: centerWidth + height * 2, y: 0), controlPoint1: CGPoint(x: centerWidth + 35, y: height), controlPoint2: CGPoint(x: centerWidth + 30, y: 0))
        // right slope/line
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        // close the path
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        
        path.close()
        
        
        return path.cgPath
        
        
    }
    
}
