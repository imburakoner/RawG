//
//  Requestable.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol Requestable {

    associatedtype RequestModel: Encodable
    associatedtype ResponseModel: Decodable

    var request: URLRequest { get }

    var requestModel: RequestModel { get }

    var httpMethod: RequestType { get }

    var path: EndpointPath { get set }

    var timeOutInterval: TimeInterval { get }

    init(requestModel: RequestModel)
}

extension Requestable {

    var request: URLRequest {
        prepareRequest()
    }

    var timeOutInterval: TimeInterval {
        return 60.0
    }

    private func prepareRequest() -> URLRequest {
        switch httpMethod {
        case .get:
            let queryItems = requestModel.asDictionary.compactMap { URLQueryItem(name: $0.key,
                                                                                 value: String(describing: $0.value))}
            let endpoint = Endpoint(path: path, queryItems: queryItems)
            var request = URLRequest(url: endpoint.url!)
            request.httpMethod = httpMethod.rawValue
            request.timeoutInterval = timeOutInterval
            return request
        case .post:
            let endpoint = Endpoint(path: path)
            var request = URLRequest(url: endpoint.url!)
            request.httpMethod = httpMethod.rawValue
            request.timeoutInterval = timeOutInterval
            request.httpBody = requestModel.asData
            return request
        default:
            return  URLRequest(url: URL(string: "")!)
        }
    }
}
