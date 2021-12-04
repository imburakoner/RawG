//
//  FakeHomeService.swift
//  RawGTests
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation
@testable import RawG

class FakeHomeService {

    var willSuccess: Bool = false

    var didFetchTrendingGames: Bool = false
    var didFetchTrendingGamesWithSuccess: Bool = false
    var didFetchTrendingGamesWithError: Bool = false

    var didFetchNewAndUpdatedGames: Bool = false
    var didFetchNewAndUpdatedGamesWithSuccess: Bool = false
    var didFetchNewAndUpdatedGamesWithError: Bool = false

}

extension FakeHomeService: HomeServiceProtocol {

    func fetchNewAndUpdatedGames(completion: @escaping ServiceCompletion<ListGamesRequest.ResponseModel>) {
        didFetchNewAndUpdatedGames = true
        if willSuccess {
            didFetchNewAndUpdatedGamesWithSuccess = true
            completion(.success(.init()))
        } else {
            didFetchNewAndUpdatedGamesWithError = true
            completion(.failure(.unknown))
        }
    }

    func fetchTrendingGames(completion: @escaping ServiceCompletion<ListGamesRequest.ResponseModel>) {
        didFetchTrendingGames = true
        if willSuccess {
            didFetchTrendingGamesWithSuccess = true
            didFetchTrendingGamesWithError = false
            completion(.success(.init()))
        } else {
            didFetchTrendingGamesWithSuccess = false
            didFetchTrendingGamesWithError = true
            completion(.failure(.unknown))
        }
    }

    func resetFlag() {
        didFetchTrendingGames = false
        didFetchTrendingGamesWithSuccess = false
        didFetchTrendingGamesWithError = false
        didFetchNewAndUpdatedGames = false
        didFetchNewAndUpdatedGamesWithSuccess = false
        didFetchNewAndUpdatedGamesWithError = false
    }
}
