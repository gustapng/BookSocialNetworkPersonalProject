//
//  RegisterPresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 27/01/25.
//

import Foundation

protocol RegisterPresenterProtocol: AnyObject {
    func presentError(_ message: String)
    func presentSuccess()
}

final class RegisterPresenter: ObservableObject, RegisterPresenterProtocol {
    private let interactor: RegisterInteractor
    private let router: RegisterRouter

    @Published var error = false
    @Published var success = false
    @Published var message: String? = nil
    @Published var isLoading: Bool = false

    init(interactor: RegisterInteractor, router: RegisterRouter) {
        self.interactor = interactor
        self.router = router
    }

    func register(name: String, email: String, password: String, confirmPassword: String) {
        self.isLoading = true
        self.interactor.register(name: name, email: email, password: password, confirmPassword: confirmPassword)
    }

    func presentError(_ returnMessage: String) {
        self.error = true
        self.message = returnMessage
        self.isLoading = false
    }

    func presentSuccess() {
        self.isLoading = false
        self.success = true
        self.message = "Email cadastrado com sucesso, por favor verifique sua caixa de email e autentique a sua nova conta!"
    }
}
