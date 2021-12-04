//
//  ServiceTests.swift
//  RawGTests
//
//  Created by Burak Oner on 16.11.2021.
//

import Foundation
import XCTest
@testable import RawG

class ServiceTests: XCTestCase {

    func testMakeRequestSuccess() {

        let session = MockURLSession(data: Data(), urlResponse: nil, error: nil)

        let mockRequestModel = MockRequestModel()
        let mockRequest = MockRequest(requestModel: mockRequestModel)

        let service = Service(session: session)

        service.makeRequest(request: mockRequest) { _ in
            XCTAssertNotNil(session.data)
            XCTAssertTrue(session.isDataTaskCalled)
            XCTAssertTrue(session.isDataTaskCompletedWithError)
        }
    }

    func testMakeRequestFail() {
        let session = MockURLSession(data: nil, urlResponse: nil, error: ServiceError.unknown)

        let mockRequestModel = MockRequestModel()
        let mockRequest = MockRequest(requestModel: mockRequestModel)

        let service = Service(session: session)

        service.makeRequest(request: mockRequest) { _ in
            XCTAssertTrue(session.isDataTaskCalled)
            XCTAssertTrue(session.isDataTaskCompletedWithError)
        }
    }
}
