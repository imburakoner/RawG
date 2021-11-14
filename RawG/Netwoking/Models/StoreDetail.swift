//
//  StoreDetail.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct StoreDetail: Codable {
    let id: Int?
    let name: String?
    let slug: String?
    let domain: String?
    let gamesCount: Int?
    let imageBackground: URL?
}
