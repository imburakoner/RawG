//
//  HomeViewModel.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol HomeViewModelProtocol {
    var featuredGameCellModels: [FeaturedGameCellModel] { get set }
    var trendingGameCellModels: [TrendingGameCellModel] { get set }

    func update(featuredGames: [Game]) -> Self

    func update(trendingGames: [Game]) -> Self

}

struct HomeViewModel {
    var featuredGameCellModels: [FeaturedGameCellModel] = .init()
    var trendingGameCellModels: [TrendingGameCellModel] = .init()
}

extension HomeViewModel: HomeViewModelProtocol { }

extension HomeViewModel {
    func update(with featuredGameCellModels: [FeaturedGameCellModel]) -> Self {
        Self(featuredGameCellModels: self.featuredGameCellModels + featuredGameCellModels,
             trendingGameCellModels: trendingGameCellModels)
    }

    func update(featuredGames: [Game]) -> HomeViewModel {
        Self(featuredGameCellModels: featuredGameCellModels + featuredGames.map(FeaturedGameCellModel.init(with: )),
             trendingGameCellModels: trendingGameCellModels)
    }

    func update(trendingGames: [Game]) -> HomeViewModel {
        Self(featuredGameCellModels: featuredGameCellModels,
             trendingGameCellModels: trendingGameCellModels + trendingGames.map(TrendingGameCellModel.init(with: )))
    }
}
