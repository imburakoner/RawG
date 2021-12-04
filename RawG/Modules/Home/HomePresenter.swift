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
    private (set) var viewModel: HomeViewModelProtocol

    weak var view: HomeView?

    init(interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol,
         viewModel: HomeViewModelProtocol) {
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
        viewModel = viewModel.update(featuredGames: games)
        view?.configure(with: viewModel)
    }

    func didRetrieveTrendingGames(_ games: [Game]) {
        viewModel = viewModel.update(trendingGames: games)
        view?.configure(with: viewModel)
    }

    func didRetrieveError(_ error: Error) {

    }
}
