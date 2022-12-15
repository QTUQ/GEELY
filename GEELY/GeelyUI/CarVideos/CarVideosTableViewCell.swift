//
//  CarDeTableViewCell.swift
//  GEELY
//
//  Created by Tuqa on 12/7/22.
//

import UIKit
import WebKit
import AVFoundation
import AVKit

class CarVideosTableViewCell: UITableViewCell {
    //MARK: -Variables
    static let id = "CarVideosTableViewCell"
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var CarImage: UIImageView!
    @IBOutlet weak var VideoImage: UIImageView!
    @IBOutlet weak var LabelName: UILabel!
    @IBOutlet weak var LabelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        adjustLabels()
        adjustImages()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: -manipulation Method (labels, images)
    func adjustLabels() {
        LabelName.font = UIFont(name: "PTSerif-Regular", size: .zero)
        LabelDescription.font = UIFont(name: "PTSerif-Regular", size: 15)
        LabelName.sizeToFit()
        LabelDescription.sizeToFit()
        LabelName.font = UIFont.boldSystemFont(ofSize: 15)
        LabelName.sizeThatFits(CGSize(width: 310, height: 33))
        LabelDescription.sizeThatFits(CGSize(width: 385, height: 78))
    }
    func adjustImages() {
        VideoImage.clipsToBounds = true
        webView.clipsToBounds = true
        webView.layer.cornerRadius = 35
        webView.layer.opacity = 0.6
        let VideoImagee = UIImage(systemName: "play.fill")
        VideoImage.image = VideoImagee!.maskWithGradientColor(color: UIColor.red)
    }
    //MARK: -implement the data in the cells method
    func cellDataSetup(carData: LobbyVideos) {
        LabelName.text = carData.videoLobbyName
        LabelDescription.text = carData.videoLobbyDescription
        let url = carData.image.imageUrl
        CarImage.downloaded(from: url)
    }
}
// MARK: -UIImage Gradient extention
extension UIImage {
    func maskWithGradientColor(color: UIColor) -> UIImage? {
        let maskImage = self.cgImage
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let bitmapContext = CGContext(data: nil,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo.rawValue)
        let locations:[CGFloat] = [0.0, 1.0]
        let bottom = UIColor(named:"Violet")!.cgColor
        let top = UIColor(named: "Blue")!.cgColor
        let colors = [top, bottom] as CFArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
        let startPoint = CGPoint(x: width/2, y: 0)
        let endPoint = CGPoint(x: width/2, y: height)
        bitmapContext!.clip(to: bounds, mask: maskImage!)
        bitmapContext!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        if let cImage = bitmapContext!.makeImage() {
            let coloredImage = UIImage(cgImage: cImage)
            return coloredImage
        }
        else  {
            return nil
        }
    }
}

