//
//  AddedByStatus.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct AddedByStatus: Decodable {
    let yet: Int?
    let owned: Int?
    let beaten: Int?
    let toplay: Int?
    let dropped: Int?
    let playing: Int?
}
