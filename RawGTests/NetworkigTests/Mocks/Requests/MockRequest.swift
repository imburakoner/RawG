//
//  MockRequest.swift
//  RawGTests
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation
@testable import RawG

struct MockRequest: URLRequestConvertible {

    typealias RequestModel = MockRequestModel
    typealias ResponseModel = MockResponseModel

    var requestModel: MockRequestModel

    var httpMethod: RequestType = .get

    var path: EndpointPath = .games

    init(requestModel: MockRequestModel) {
        self.requestModel = requestModel
    }

}
