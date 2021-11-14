//
//  TrendingGameCellModel.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct TrendingGameCellModel {
    let id: Int
    let name: String
    let imageURL: URL?
}

extension TrendingGameCellModel {
    init(with game: Game) {
        id = game.id
        name = game.name ?? ""
        imageURL = game.backgroundImage
    }
}

extension TrendingGameCellModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
