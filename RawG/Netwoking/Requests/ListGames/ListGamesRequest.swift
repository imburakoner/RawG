//
//  ListGamesRequest.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct ListGamesRequest: Requestable {

    typealias RequestModel = ListGamesRequestModel

    typealias ResponseModel = ListGamesResponse

    var httpMethod: RequestType = .get

    var path: EndpointPath = .games

    var requestModel: ListGamesRequestModel

    init(requestModel: ListGamesRequestModel) {
        self.requestModel = requestModel
    }
}