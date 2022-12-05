//
//  CarCollectionViewCell.swift
//  GEELY
//
//  Created by Tuqa on 12/5/22.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    static let id = "CustomCell2"

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setProgressView()
        labelOne()
        labelTwo()
        labelThree()
    }
    
    func labelOne() {
        label1.textAlignment = .center
        label3.font = UIFont(name: "PTSerif-Regular", size: 15)
        label3.sizeToFit()
    }
    func labelTwo() {
        label3.textAlignment = .center
        label3.font = UIFont(name: "PTSerif-Regular", size: 15)
        label3.sizeToFit()
    }
    func labelThree() {
        label3.textAlignment = .center
        label3.font = UIFont(name: "PTSerif-Regular", size: 15)
        label3.sizeToFit()
        label2.layer.cornerRadius = 15
    }
    
    // MARK: -set the progress View
     func setProgressView() {
        progressView.trackTintColor = .quaternarySystemFill
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 5
        progressView.progress = 0.7
        progressView.semanticContentAttribute = .forceRightToLeft
        progressView.frame = CGRect(x: 66, y: contentView.frame.size.height/1.53, width: 200, height: 30)
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
