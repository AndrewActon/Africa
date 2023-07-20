//
//  VideoModel.swift
//  Africa
//
//  Created by Andrew Acton on 7/19/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
