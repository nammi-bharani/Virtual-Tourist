//
//  FlickrResponse.swift
//  Virtual Tourist
//
//  Created by Bharani Nammi on 7/17/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation

struct FlickrResponse: Codable {
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [Photo]
}

struct Photo: Codable {
    let id: String
    let owner: String
    let secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}
