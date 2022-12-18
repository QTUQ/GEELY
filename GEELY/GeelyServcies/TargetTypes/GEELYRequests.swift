//
//  GEELYTargetTypes.swift
//  GEELY
//
//  Created by Tuqa on 12/13/22.
//

import Foundation
import UIKit

//MARK: -define the the API targetType (requests)
enum GeelyNetworking {
    case getLobbieVideos
}
extension GeelyNetworking: TargetType {
    var domian: String {
        switch self {
        case .getLobbieVideos:
            return "https://testservice.geely.co.il///api"
        }
    }
    var path: String {
        switch self {
        case .getLobbieVideos:
            return "/videos/lobbyVideos"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getLobbieVideos:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getLobbieVideos:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        switch self {
        case .getLobbieVideos:
            return [:]
        }
    }
}

