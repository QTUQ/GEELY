//
//  APIHandler.swift
//  GEELY
//
//  Created by Tuqa on 12/5/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIHandler: HomeViewController {
   
    static let sharedInstance = APIHandler()
    var post = [posts]()
    func fetchingData() {
        let url = "https://testservice.geely.co.il///api/videos/lobbyVideos"
        Alamofire.request(url, method: .get).responseJSON {response in // closure executed when the request completes.
            guard let data = response.data else { return }
            do {
                let result = try JSONDecoder().decode(Resultes.self, from: data)
               
                DispatchQueue.main.async {
                    self.post = result.body
                    }
                print(result)
            }
            catch {
                print("error decodinh \(error)")
            }
            
        }.resume()
    }
}

//MARK: - downloding the images from url 
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

