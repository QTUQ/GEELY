//
//  CustomCell2.swift
//  GEELY
//
//  Created by Tuqa on 11/24/22.
//

import UIKit
class CustomCell2: UICollectionViewCell {
    
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        contentView.backgroundColor = .clear
    //        contentView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
    //        contentView.layer.shadowOpacity = 20
    //        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
    //        contentView.layer.cornerRadius = 40
    //        contentView.addSubview(label)
    //        contentView.addSubview(image)
    //        contentView.addSubview(label2)
    //        contentView.addSubview(image2)
    //        contentView.addSubview(image3)
    //        contentView.addSubview(label3)
    
    //    }
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    // MARK: -set the second custom cell
    //    static let id = "CustomCell2"
    //    fileprivate var image: UIImageView = {
    //        let image = UIImageView()
    //        image.translatesAutoresizingMaskIntoConstraints = false
    //        image.clipsToBounds = true
    //        image.image = UIImage(named: "imageIcon")
    //        return image
    //    }()
    //    fileprivate var image2: UIImageView = {
    //        let image2 = UIImageView()
    //        image2.translatesAutoresizingMaskIntoConstraints = false
    //        image2.image = UIImage(named: "imageIcon")
    //        image2.clipsToBounds = true
    //        return image2
    //    }()
    //    fileprivate var image3: UIImageView = {
    //        let image3 = UIImageView()
    //        image3.translatesAutoresizingMaskIntoConstraints = false
    //        image3.clipsToBounds = true
    //        image3.image = UIImage(named: "imageIcon")
    //        image3.backgroundColor = UIColor(named: "LightBlue")
    //        image3.layer.cornerRadius = 10
    //        return image3
    //    }()
    //    fileprivate var label: UILabel = {
    //        let label = UILabel()
    //        let gradientLayer = CAGradientLayer()
    //        gradientLayer.frame = CGRect(x: 313, y: -18, width: 5, height: 110 )
    //        gradientLayer.colors = [UIColor(named: "Blue")!.cgColor, UIColor(named:"Violet")!.cgColor]
    //        gradientLayer.startPoint = CGPoint(x: 0.7,y: 0.3)
    //        gradientLayer.endPoint = CGPoint(x: 0.7,y: 0.90)
    //        gradientLayer.cornerRadius = 20
    //        label.text = "label"
    //        label.textColor = UIColor.black
    //        label.backgroundColor = UIColor.white
    //        label.layer.cornerRadius = 15
    //        label.textAlignment = .center
    //        label.clipsToBounds = true
    //        label.font = UIFont(name: "PTSerif-Regular", size: 15)
    //        label.sizeToFit()
    //        label.layer.insertSublayer(gradientLayer, at: 0)
    //        return label
    //    }()
    //    fileprivate var label2: UILabel = {
    //        let label2 = UILabel()
    //        label2.backgroundColor = UIColor.white
    //        label2.layer.cornerRadius = 15
    //        label2.clipsToBounds = true
    //        label2.numberOfLines = 3
    //        label2.text = "label"
    //        label2.font = UIFont(name: "PTSerif-Regular", size: 15)
    //        label2.textAlignment = .center
    //        label2.sizeToFit()
    //        return label2
    //    }()
    //    fileprivate var label3: UILabel = {
    //        let label3 = UILabel()
    //        label3.clipsToBounds = true
    //        label3.translatesAutoresizingMaskIntoConstraints = false
    //        label3.text = "label"
    //        label3.textAlignment = .center
    //        label3.font = UIFont(name: "PTSerif-Regular", size: 15)
    //        label3.sizeToFit()
    //        return label3
    //    }()
    //MARK: - subViews Manpiulation
    //    override func layoutSubviews() {
    //        super.layoutSubviews()
    //        label.frame = CGRect(x: contentView.frame.size.width/19, y: contentView.frame.size.height/1.33, width: contentView.frame.size.width-40, height: 70)
    //        label2.frame = CGRect(x: contentView.frame.size.width/19, y: contentView.frame.size.height/1.92, width: contentView.frame.size.width-40, height: 65)
    //        label3.frame = CGRect(x: contentView.frame.size.width/16, y: 100, width: contentView.frame.size.width-30, height: 70)
    //        image.frame = CGRect(x: 130, y: contentView.frame.size.height/20, width: 100, height: 70)
    //        image2.frame = CGRect(x: 300, y: contentView.frame.size.height/1.7, width: 30, height: 30)
    //        image3.frame = CGRect(x: 300, y: 300, width: 30, height: 30)
    //    }
    
}
