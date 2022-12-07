//
//  Data.swift
//  GEELY
//
//  Created by Tuqa on 12/5/22.
//

import Foundation

struct Resultes: Codable {
    let body: [posts]
}
struct posts: Codable {
    let id: String
    let videoLobbyName: String
    let videoLobbyDescription: String
    let url: String?
    let image: images
    let lobbyCategoryId: Int
    let isNewTab: Bool
}

struct images: Codable {
    let imageUrl: String
}
