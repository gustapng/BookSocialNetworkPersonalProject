//
//  LoginPresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func login(email: String, password: String)
    func loginSuccess()
    func loginFailed(errorMessage: String)
}

final class LoginPresenter: ObservableObject, LoginPresenterProtocol {
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol

    @Published var isLoading = false
    @Published var errorMessage: String?

    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil

        interactor.login(email: email, password: password)
    }

    func loginSuccess() {
        DispatchQueue.main.async {
            self.isLoading = false
            self.router.navigateToHome()
        }
    }

    func loginFailed(errorMessage: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMessage = errorMessage
        }
    }
}
