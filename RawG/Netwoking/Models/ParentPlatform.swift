//
//  ParentPlatform.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct ParentPlatform: Codable {
    let id: Int?
    let name: String?
    let slug: String?
    let image: URL?
    let yearEnd: Int?
    let yearStart: Int?
    let gamesCount: Int?
    let imageBackground: URL?
}
