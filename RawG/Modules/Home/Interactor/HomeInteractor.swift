//
//  HomeInteractor.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {

    func didRetrieveNewAndUpdatedGames(_ games: [Game])
    func didRetrieveTrendingGames(_ games: [Game])
    func didRetrieveError(_ error: Error)
}

protocol HomeInteractorProtocol {
    func fetchNewAndTrendingGames()
    func fetchTrendingGames()
}

final class HomeInteractor {
    let service: HomeServiceProtocol

    weak var output: HomeInteractorOutput?

    init(service: HomeServiceProtocol) {
        self.service = service
    }
}

extension HomeInteractor: HomeInteractorProtocol {
    func fetchTrendingGames() {
        service.fetchTrendingGames { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.output?.didRetrieveTrendingGames(response.results ?? [])
            case .failure(let error):
                self.output?.didRetrieveError(error)
            }
        }
    }

    func fetchNewAndTrendingGames() {
        service.fetchNewAndUpdatedGames { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.output?.didRetrieveNewAndUpdatedGames(response.results ?? [])
            case .failure(let error):
                self.output?.didRetrieveError(error)
            }
        }
    }

}
