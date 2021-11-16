//
//  Game.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Game: Decodable, Hashable {
    let id: Int
    let slug: String?
    let name: String?
    let released: String?
    let tba: Bool?
    let backgroundImage: URL?
    let rating: Double?
    let ratingTop: Double?
    let ratings: [Rating]?
    let ratingsCount: Int?
    let reviewsTextCount: Int?
    let added: Int?
    let addedByStatus: AddedByStatus?
    let metacritic: Int?
    let playtime: Int?
    let suggestionsCount: Int?
    let updated: String?
    let userGame: String?
    let reviewsCount: Int?
    let saturatedColor: String?
    let dominantColor: String?
    let platforms: [Platform]?
    let parentPlatforms: [ParentPlatform]?
    let genres: [Genre]?
    let stores: [Store]?
    let clip: String?
    let tags: [Tag]?
    let esrbRating: ESBRRating?
    let shortScreenshots: [ScreenShot]?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
}
