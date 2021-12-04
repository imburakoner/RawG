//
//  ListGamesRequestTests.swift
//  RawGTests
//
//  Created by Burak Oner on 17.11.2021.
//

@testable import RawG
import XCTest

final class ListGamesRequestTests: XCTestCase {

    func testRequestMethod() {
        let request = ListGamesRequest(requestModel: ListGamesRequestModel())
        XCTAssertTrue(request.httpMethod == .get)
    }

    func testRequestPath() {
        let request = ListGamesRequest(requestModel: ListGamesRequestModel())
        XCTAssertTrue(request.path == .games)
    }

}
