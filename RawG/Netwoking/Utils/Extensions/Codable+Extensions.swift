//
//  Codable+Extensions.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

extension Encodable {

    var asDictionary: [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        guard let data = try? encoder.encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
              else { return [:] }
        return dictionary
    }

    var asData: Data? {
        try? JSONEncoder().encode(self)
    }
}
