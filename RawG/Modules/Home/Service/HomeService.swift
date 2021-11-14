//
//  HomeService.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol HomeServiceProtocol {
    func fetchNewAndUpdatedGames(completion: @escaping ServiceResultCompletion<ListGamesRequest.ResponseModel>)
    func fetchTrendingGames(completion: @escaping ServiceResultCompletion<ListGamesRequest.ResponseModel>)
}

struct HomeService {

    let service: Service

}

extension HomeService: HomeServiceProtocol {

    func fetchNewAndUpdatedGames(completion: @escaping ServiceResultCompletion<ListGamesRequest.ResponseModel>) {
        let requestModel = ListGamesRequestModel(pageSize: 10, ordering: "-added")
        let request = ListGamesRequest(requestModel: requestModel)
        service.makeRequest(request: request, completion: completion)
    }

    func fetchTrendingGames(completion: @escaping ServiceResultCompletion<ListGamesRequest.ResponseModel>) {
        let requestModel = ListGamesRequestModel(pageSize: 20, ordering: "-relevance")
        let request = ListGamesRequest(requestModel: requestModel)
        service.makeRequest(request: request, completion: completion)
    }

}
