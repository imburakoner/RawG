//
//  HomeViewModel.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct HomeViewModel {
    var featuredGameCellModels: [FeaturedGameCellModel] = .init()
    var trendingGameCellModels: [TrendingGameCellModel] = .init()
}

extension HomeViewModel {
    func update(with featuredGameCellModels: [FeaturedGameCellModel]) -> Self {
        Self(featuredGameCellModels: self.featuredGameCellModels + featuredGameCellModels,
             trendingGameCellModels: trendingGameCellModels)
    }

    func update(with trendingGameCellModels: [TrendingGameCellModel]) -> Self {
        Self(featuredGameCellModels: self.featuredGameCellModels,
             trendingGameCellModels: self.trendingGameCellModels + trendingGameCellModels)
    }
}
