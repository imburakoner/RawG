//
//  HomeService.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol HomeServiceProtocol {
    func fetchNewAndUpdatedGames(completion: @escaping ServiceCompletion<ListGamesRequest.ResponseModel>)
    func fetchTrendingGames(completion: @escaping ServiceCompletion<ListGamesRequest.ResponseModel>)
}

struct HomeService {

    let service: Service

}

extension HomeService: HomeServiceProtocol {

    func fetchNewAndUpdatedGames(completion: @escaping ServiceCompletion<ListGamesRequest.ResponseModel>) {
        let formattedStartDate = Date.createDate(byAdding: .weekOfYear, value: -1).format(by: .dashed)
        let endDate = Date.now.format(by: .dashed)
        let requestModel = ListGamesRequestModel(pageSize: 10, dates: formattedStartDate + "," + endDate)
        let request = ListGamesRequest(requestModel: requestModel)
        service.makeRequest(request: request, completion: completion)
    }

    func fetchTrendingGames(completion: @escaping ServiceCompletion<ListGamesRequest.ResponseModel>) {
        let requestModel = ListGamesRequestModel(pageSize: 20, ordering: "-relevance")
        let request = ListGamesRequest(requestModel: requestModel)
        service.makeRequest(request: request, completion: completion)
    }

}
