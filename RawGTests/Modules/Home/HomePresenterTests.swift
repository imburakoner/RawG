//
//  HomePresenterTests.swift
//  RawGTests
//
//  Created by Burak Oner on 3.12.2021.
//

import XCTest
@testable import RawG

class HomePresenterTests: XCTestCase {

    var presenter: HomePresenter!

    let fakeInteractor = FakeHomeInteractor()
    let fakeRouter = FakeHomeRouter()
    let fakeViewModel = FakeHomeViewModel()

    override func setUp() {
        presenter = HomePresenter(interactor: fakeInteractor,
                                  router: fakeRouter,
                                  viewModel: fakeViewModel)
        fakeInteractor.output = presenter
    }

    func testFetchTrendingGamesSuccess() {
        fakeInteractor.fetchNewAndUpdatedGames()
        XCTAssertTrue(presenter.viewModel.trendingGameCellModels.isEmpty)
    }

    func testFetchNewAndUpdatedGamesSuccess() {
        fakeInteractor.fetchTrendingGames()
        XCTAssertTrue(presenter.viewModel.featuredGameCellModels.isEmpty)
    }

    func testFetchNewAndUpdatedGamesFail() {
        fakeInteractor.willSuccess = false
        fakeInteractor.fetchNewAndUpdatedGames()
        XCTAssertTrue(!fakeInteractor.didFetchNewAndUpdatedGames)
    }

    func testFetchTrendingGamesFail() {
        fakeInteractor.willSuccess = false
        fakeInteractor.fetchTrendingGames()
        XCTAssertTrue(!fakeInteractor.didFetchTrendingGames)
    }

    override func tearDown() {
        fakeInteractor.resetFlags()
    }
}
