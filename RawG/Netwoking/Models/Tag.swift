//
//  Tag.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Tag: Decodable {
    let id: Int?
    let name: String?
    let slug: String?
    let language: String?
    let gamesCount: Int?
    let imageBackground: URL?
}
