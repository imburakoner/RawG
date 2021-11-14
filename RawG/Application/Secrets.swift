//
//  Secrets.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

enum Secrets {
    static let APIKEY: String = {
        guard let filePath = Bundle.main.path(forResource: "Secrets",
                                              ofType: "plist")
        else { fatalError("Couldn't find file 'Secrets.plist'.") }

        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String
        else {
            fatalError("Couldn't find key 'API_KEY' in 'Secrets.plist'.")
        }
        return value
    }()
}
