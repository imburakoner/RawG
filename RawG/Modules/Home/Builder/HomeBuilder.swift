//
//  HomeBuilder.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

enum HomeBuilder {
    static func build() -> HomeViewController {
        let service = HomeService(service: Service(session: URLSession.shared))
        let interactor = HomeInteractor(service: service)
        let router = HomeRouter()
        let viewModel = HomeViewModel()
        let presenter  = HomePresenter(interactor: interactor,
                                       router: router,
                                       viewModel: viewModel)
        let viewController = HomeViewController()

        viewController.presenter = presenter
        presenter.view = viewController
        interactor.output = presenter

        return viewController
    }
}
