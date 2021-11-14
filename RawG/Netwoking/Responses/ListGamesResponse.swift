//
//  ListGamesResponse.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct ListGamesResponse: Decodable {
    var count: Int?
    var next: URL?
    var previous: URL?
    var results: [Game]?
    var seoTitle: String?
    var seoDescription: String?
    var seoH1: String?
    var noindex: Bool?
    var nofollow: Bool?
    var description: String?
    var nofollowCollections: [String]?
}
