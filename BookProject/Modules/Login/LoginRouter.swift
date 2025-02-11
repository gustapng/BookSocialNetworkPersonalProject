//
//  LoginRouter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation

protocol LoginRouterProtocol {
    func navigateToRegister() -> RegisterView
}

final class LoginRouter: LoginRouterProtocol {
    func navigateToRegister() -> RegisterView {
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        return RegisterView(presenter: presenter, router: router)
    }
}
