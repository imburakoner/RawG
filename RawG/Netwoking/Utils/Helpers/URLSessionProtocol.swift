//
//  URLSessionProtocol.swift
//  RawG
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation

typealias URLSessionCompletion = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask<Request: URLRequestConvertable>(with convertable: Request,
                                                  completion: @escaping URLSessionCompletion) -> DataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask<Request: URLRequestConvertable>(with requestConvertable: Request,
                                                  completion: @escaping URLSessionCompletion) -> DataTaskProtocol {
        dataTask(with: requestConvertable.convert(), completionHandler: completion)
    }
}
