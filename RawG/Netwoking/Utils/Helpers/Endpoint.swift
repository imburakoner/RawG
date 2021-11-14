//
//  Endpoint.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Endpoint {
    let path: EndpointPath
    var queryItems: [URLQueryItem] = []

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.rawg.io"
        components.path = path.rawValue
        components.queryItems = queryItems
        return components.url
    }
}
