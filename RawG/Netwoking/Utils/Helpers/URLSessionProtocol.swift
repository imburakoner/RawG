//
//  URLSessionProtocol.swift
//  RawG
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation

typealias URLSessionCompletion = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask<Request: URLRequestConvertible>(with convertable: Request,
                                                  completion: @escaping URLSessionCompletion) -> DataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask<Request: URLRequestConvertible>(with requestConvertable: Request,
                                                  completion: @escaping URLSessionCompletion) -> DataTaskProtocol {
        dataTask(with: requestConvertable.convert(), completionHandler: completion)
    }
}
