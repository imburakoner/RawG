//
//  ServiceError.swift
//  RawG
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case noInternetConnection
}

extension ServiceError {
    init(withError error: Error) {
        let error = error as NSError

        if error.code == 999 {
            self = .noInternetConnection
        } else {
            self = .unknown
        }
    }
}
