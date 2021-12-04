//
//  MockDataTask.swift
//  RawGTests
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation
@testable import RawG

class MockDataTask: DataTaskProtocol {

    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?

    var isDataTaskCalled: Bool = false
    var isDataTaskCompletedWithSuccess: Bool = false
    var isDataTaskCompletedWithError: Bool = false

    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    init(data: Data? = nil, urlResponse: URLResponse? = nil,
         error: Error? = nil, completionHandler: ((Data?, URLResponse?, Error?) -> Void)? = nil) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
        self.completionHandler = completionHandler
    }

    func resume() {
        completionHandler?(data, urlResponse, error)
    }
}
