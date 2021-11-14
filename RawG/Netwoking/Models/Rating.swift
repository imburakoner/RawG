//
//  Rating.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Rating: Decodable {
    let id: Int?
    let title: String?
    let count: Int?
    let percent: Double?
}
