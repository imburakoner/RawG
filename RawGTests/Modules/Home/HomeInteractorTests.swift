//
//  HomeInteractorTests.swift
//  RawGTests
//
//  Created by Burak Oner on 17.11.2021.
//

import Foundation
import XCTest
@testable import RawG

class HomeInteractorTests: XCTestCase {

    var interactor: HomeInteractorProtocol!
    let fakeHomeService = FakeHomeService()

    override func setUp() {
        super.setUp()
        interactor = HomeInteractor(service: fakeHomeService)
    }

    func testFetchTrendingGamesSuccess() {
        fakeHomeService.willSuccess = true
        interactor.fetchTrendingGames()
        XCTAssertTrue(fakeHomeService.didFetchTrendingGames)
        XCTAssertTrue(fakeHomeService.didFetchTrendingGamesWithSuccess)
    }

    func testFetchTrendingGamesFail() {
        fakeHomeService.willSuccess = false
        interactor.fetchTrendingGames()
        XCTAssertTrue(fakeHomeService.didFetchTrendingGames)
        XCTAssertTrue(fakeHomeService.didFetchTrendingGamesWithError)
    }

    func testFetchNewAndUpdatedGamesSuccess() {
        fakeHomeService.willSuccess = true
        interactor.fetchNewAndUpdatedGames()
        XCTAssertTrue(fakeHomeService.didFetchNewAndUpdatedGamesWithSuccess)
        XCTAssertTrue(fakeHomeService.didFetchNewAndUpdatedGames)
    }

    func testFetchNewAndUpdatedGamesFail() {
        fakeHomeService.willSuccess = false
        interactor.fetchNewAndUpdatedGames()
        XCTAssertTrue(fakeHomeService.didFetchNewAndUpdatedGamesWithError)
        XCTAssertTrue(fakeHomeService.didFetchNewAndUpdatedGames)
    }

    override func tearDown() {
        super.tearDown()
        fakeHomeService.resetFlag()
    }
}
