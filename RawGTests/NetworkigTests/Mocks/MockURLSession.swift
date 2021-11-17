//
//  MockURLSession.swift
//  RawGTests
//
//  Created by Burak Oner on 16.11.2021.
//

import Foundation
@testable import RawG

class MockURLSession: URLSessionProtocol {

    var isDataTaskCalled: Bool = false
    var isDataTaskCompletedWithSuccess: Bool = false
    var isDataTaskCompletedWithError: Bool = false

    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?

    init(data: Data? = nil, urlResponse: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }

    func dataTask<Request: URLRequestConvertible>(with convertable: Request,
                                                  completion: @escaping URLSessionCompletion) -> DataTaskProtocol {
        self.isDataTaskCalled = true
        self.isDataTaskCompletedWithError = error != nil
        self.isDataTaskCompletedWithSuccess = error == nil

        return MockDataTask(data: data, urlResponse: urlResponse,
                                     error: error, completionHandler: completion)
    }
}
