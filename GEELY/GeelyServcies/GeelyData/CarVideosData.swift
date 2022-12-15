//
//  Data.swift
//  GEELY
//
//  Created by Tuqa on 12/5/22.
//

import Foundation

struct Resultes: Codable {
    let body: [LobbyVideos]
}
struct LobbyVideos: Codable {
    let id: String
    let videoLobbyName: String
    let videoLobbyDescription: String
    let url: String?
    let deepLink: DeepLink?
    let image: Images
    let lobbyCategoryId: Int
    let isNewTab: Bool
}
struct Images: Codable {
    let imageUrl: String
}
struct DeepLink: Codable {
    let imageUrl: String
}
