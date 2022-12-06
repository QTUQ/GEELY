//
//  CarCollectionViewCell.swift
//  GEELY
//
//  Created by Tuqa on 12/5/22.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    static let id = "CarCollectionViewCell"
    // MARK: -Variables
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    // MARK: -initi the nib
    override func awakeFromNib() {
        super.awakeFromNib()
        setProgressView()
        labelOne()
        labelTwo()
        labelThree()
    // MARK: -method manipulation
    }
    func labelOne() {
        label1.font = UIFont(name: "PTSerif-Regular", size: 15)
    }
    func labelTwo() {
        label2.clipsToBounds = true
        label2.layer.cornerRadius = 15
        label2.font = UIFont(name: "PTSerif-Regular", size: 15)
    }
    func labelThree() {
        label3.clipsToBounds = true
        label3.font = UIFont(name: "PTSerif-Regular", size: 15)
        label3.layer.cornerRadius = 15
    }
    
    // MARK: -set the progress View
    func setProgressView() {
        progressView.trackTintColor = .quaternarySystemFill
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 5
        progressView.progress = 0.7
        progressView.semanticContentAttribute = .forceRightToLeft
        progressView.frame = CGRect(x: 66, y: contentView.frame.size.height/1.6, width: 200, height: 30)
        progressView.transform = CGAffineTransform(scaleX: 1.3, y: 2.6)
        let gradientImage = UIImage.gradientImage(with:progressView.frame,colors:[UIColor(named: "Blue")!.cgColor, UIColor(named:"Violet")!.cgColor],locations: nil)
        progressView.progressImage = gradientImage!
        contentView.addSubview(progressView)
    }
}
// MARK: -convert gradientLayer to image
fileprivate extension UIImage {
    static func gradientImage(with bounds: CGRect,colors: [CGColor],locations: [NSNumber]?) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0,y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,y: 0.5)
        gradientLayer.cornerRadius = 5
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
