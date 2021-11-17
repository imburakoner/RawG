//
//  URLSessionDataTaskProtocol.swift
//  RawG
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation

protocol DataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: DataTaskProtocol {
}
