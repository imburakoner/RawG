//
//  FakeHomeViewModel.swift
//  RawGTests
//
//  Created by Burak Oner on 19.11.2021.
//

@testable import RawG
import XCTest

class FakeHomeViewModel {

    var trendingGameCellModels: [TrendingGameCellModel] = .init()
    var featuredGameCellModels: [FeaturedGameCellModel] = .init()

    var didFetchNewAndUpdatedGames: Bool = false
    var didFetchTrendingGames: Bool = false

    func resetFlags() {
        didFetchNewAndUpdatedGames = false
        didFetchTrendingGames = false
    }
}

extension FakeHomeViewModel: HomeViewModelProtocol {

    func update(featuredGames: [Game]) -> Self {
        self
    }

    func update(trendingGames: [Game]) -> Self {
        self
    }

}
