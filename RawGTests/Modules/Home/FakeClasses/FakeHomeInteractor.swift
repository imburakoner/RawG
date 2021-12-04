//
//  FakeHomeInteractor.swift
//  RawGTests
//
//  Created by Burak Oner on 19.11.2021.
//

@testable import RawG
import XCTest

class FakeHomeInteractor {
    var didFetchNewAndUpdatedGames: Bool = false
    var didFetchTrendingGames: Bool = false

    var willSuccess: Bool = true

    weak var output: HomeInteractorOutput?

    func resetFlags() {
        didFetchNewAndUpdatedGames = false
        didFetchTrendingGames = false
    }
}

extension FakeHomeInteractor: HomeInteractorProtocol {

    func fetchNewAndUpdatedGames() {
        guard willSuccess else {
            output?.didRetrieveError(ServiceError.unknown)
            return
        }
        didFetchNewAndUpdatedGames = true
        output?.didRetrieveTrendingGames([])
    }

    func fetchTrendingGames() {
        guard willSuccess else {
            output?.didRetrieveError(ServiceError.unknown)
            return
        }
        didFetchTrendingGames = true
        output?.didRetrieveNewAndUpdatedGames([])
    }

}
