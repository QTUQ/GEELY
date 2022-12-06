//
//  CustomCell.swift
//  GEELY
//
//  Created by Tuqa on 11/23/22.
//

import Foundation
import UIKit

class servicesCollViewCell1: UICollectionViewCell {
    //MARK: - initi the views
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .quaternarySystemFill
        contentView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        contentView.layer.shadowOpacity = 20
        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        contentView.layer.cornerRadius = 15
        contentView.addSubview(image)
        contentView.addSubview(mlabel)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -set the custom cell one 
    static let identifier = "CustomCell1"
    fileprivate let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.image = UIImage(named: "imageIcon")
        return image
    }()
    fileprivate let mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.text = "home"
        mlabel.textAlignment = .center
        mlabel.textColor = .black
        mlabel.clipsToBounds = true
        mlabel.font = UIFont(name: "PTSerif-Regular", size: 15)
        return mlabel
    }()
   
    //MARK: - subViews Manipulation
    override func layoutSubviews() {
        super.layoutSubviews()
        mlabel.frame = CGRect(x: 5, y: contentView.frame.size.height-60, width: contentView.frame.size.width-10, height: 50)
        image.frame = CGRect(x: 32, y: 20, width: 40, height: 40)
    }
    public func configure(label: String) {
        mlabel.text = label
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        mlabel.text = nil
    }
}

