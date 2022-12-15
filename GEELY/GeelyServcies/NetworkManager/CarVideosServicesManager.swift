//
//  CarVideosServicesManager.swift
//  GEELY
//
//  Created by Tuqa on 12/12/22.
//

import Foundation
import UIKit
import Alamofire

//MARK: -protocol for soft coupling (for decreased dependency with class)
protocol lobbyVideosAPI {
    func getlobbyVideos(completion: @escaping (Result<Resultes?>) -> ())
}
//MARK: -getting LobbyVideos request
class CarVideosServicesManager: ServicesManager<GeelyNetworking>, lobbyVideosAPI {
    func getlobbyVideos(completion: @escaping (Result<Resultes?>) -> ()) {
        self.fetchingData(target: .getLobbieVideos, response: Resultes.self) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}


