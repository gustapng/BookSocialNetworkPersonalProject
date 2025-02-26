//
//  WelcomeRouter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import Foundation

protocol WelcomeRouterProtocol {
    func navigateToLoginView() -> LoginView
}

class WelcomeRouter: WelcomeRouterProtocol {
    func navigateToLoginView() -> LoginView {
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return LoginView(presenter: presenter, router: router)
    }
}
