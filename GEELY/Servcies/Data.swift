//
//  Data.swift
//  GEELY
//
//  Created by Tuqa on 12/5/22.
//

import Foundation

struct Resultes: Decodable {
    let body: [posts]
}

struct posts: Decodable {
    let id: String
    let videoLobbyName: String
    let videoLobbyDescription: String
    let url: String?
    let image: [images]
    
}

struct images: Decodable {
    let imageUrl: String
    let lobbyCategoryId: Int
    let isNewTab: Bool
}
