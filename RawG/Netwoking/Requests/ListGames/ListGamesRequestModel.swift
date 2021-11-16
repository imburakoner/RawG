//
//  ListGamesRequestModel.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct ListGamesRequestModel: Encodable {

    let key: String = Secrets.APIKEY
    var pageSize: Int?
    var page: Int?
    var search: String?
    var searchPrecise: Bool?
    var searchExact: Bool?
    var parentPlatforms: String?
    var platforms: String?
    var stores: String?
    var developers: String?
    var publishers: String?
    var genres: String?
    var tags: String?
    var creators: String?
    var dates: String?
    var updated: String?
    var platformsCount: String?
    var metacritic: String?
    var excludeCollection: Int?
    var excludeAdditions: Bool?
    var excludeParents: Bool?
    var excludeGameSeries: Bool?
    var excludeStores: String?
    var ordering: String?
}
