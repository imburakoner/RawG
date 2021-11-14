//
//  HomeInteractor.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {

}

protocol HomeInteractorProtocol {
    func fetchNewAndTrendingGames()
}

final class HomeInteractor {
    let service: HomeServiceProtocol

    weak var output: HomeInteractorOutput?

    init(service: HomeServiceProtocol) {
        self.service = service
    }
}

extension HomeInteractor: HomeInteractorProtocol {
    func fetchNewAndTrendingGames() {
        service.fetchNewAndUpdatedGames { result in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                break
            }
        }
    }

}
