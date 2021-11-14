//
//  Genre.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Genre: Decodable {
    let id: Int?
    let name: String?
    let slug: String?
    let gamesCount: Int?
    let imageBackground: URL?
}
