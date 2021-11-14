//
//  HomeViewModel.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct HomeViewModel {
    var games: [FeaturedGameCellModel] = .init()
}

extension HomeViewModel {
    func update(featuredGames: [FeaturedGameCellModel]) -> Self {
        Self(games: games + featuredGames)
    }
}
