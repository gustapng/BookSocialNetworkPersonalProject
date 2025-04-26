//
//  LoginRouter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation
import SwiftUICore

protocol LoginRouterProtocol {
    func navigateToHome() -> HomeView
    func navigateToForgotPasswordView() -> ForgotPasswordView
    func navigateToRegisterView() -> RegisterView
}

final class LoginRouter: LoginRouterProtocol {
    func navigateToHome() -> HomeView {
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return HomeView(presenter: presenter, router: router)
    }

    func navigateToRegisterView() -> RegisterView {
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return RegisterView(presenter: presenter, router: router)
    }

    func navigateToForgotPasswordView() -> ForgotPasswordView {
        let interactor = ForgotPasswordInteractor()
        let router = ForgotPasswordRouter()
        let presenter = ForgotPasswordPresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return ForgotPasswordView(presenter: presenter, router: router)
    }
}
