//
//  LoginRouter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation
import SwiftUICore

protocol LoginRouterProtocol {
    func navigateToRegisterView() -> RegisterView
}

final class LoginRouter: LoginRouterProtocol {
    func navigateToRegisterView() -> RegisterView {
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return RegisterView(presenter: presenter, router: router)
    }
}
