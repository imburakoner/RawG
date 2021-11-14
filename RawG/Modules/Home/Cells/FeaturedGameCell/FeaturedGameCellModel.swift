//
//  FeaturedGameCellModel.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct FeaturedGameCellModel {
    let id: Int
    let name: String
    let imageURL: URL?
}

extension FeaturedGameCellModel {
    init(with game: Game) {
        id = game.id
        name = game.name ?? ""
        imageURL = game.backgroundImage
    }
}

extension FeaturedGameCellModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
