//
//  HomeRouter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 19/02/25.
//

import Foundation

protocol HomeRouterProtocol {
    func navigateToHome() -> HomeView
}

final class HomeRouter {
    func navigateToHome() -> HomeView {
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return HomeView(presenter: presenter, router: router)
    }
}
