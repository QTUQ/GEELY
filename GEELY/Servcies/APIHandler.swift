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

class APIHandler {
    static let sharedInstance = APIHandler()
    var post = [posts]()
    func fetchingData() {
        // create url
        let url = "https://testservice.geely.co.il///api/videos/lobbyVideos"
        Alamofire.request(url, method: .get).responseJSON {response in // closure executed when the request completes.
            //debugPrint(resopnse)
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print("JSON: \(json)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

