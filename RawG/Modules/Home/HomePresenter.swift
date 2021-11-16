//
//  HomePresenter.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad()
}

final class HomePresenter {
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    private var viewModel: HomeViewModel

    weak var view: HomeView?

    init(interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol,
         viewModel: HomeViewModel) {
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        interactor.fetchNewAndUpdatedGames()
        interactor.fetchTrendingGames()
    }
}

extension HomePresenter: HomeInteractorOutput {

    func didRetrieveNewAndUpdatedGames(_ games: [Game]) {
        viewModel = viewModel.update(with: games.map(FeaturedGameCellModel.init(with: )))
        view?.configure(with: viewModel)
    }

    func didRetrieveTrendingGames(_ games: [Game]) {
        viewModel = viewModel.update(with: games.map(TrendingGameCellModel.init(with: )))
        view?.configure(with: viewModel)
    }

    func didRetrieveError(_ error: Error) {

    }
}
