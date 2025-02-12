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
    @Published var error = false
    @Published var success = false
    @Published var message: String? = nil
    @Published var isLoading: Bool = false
    var interactor: RegisterInteractor?
    var router: RegisterRouterProtocol?

    init(interactor: RegisterInteractor, router: RegisterRouter) {
        self.interactor = interactor
    }

    func register(name: String, email: String, password: String, confirmPassword: String) {
        isLoading = true
        interactor?.register(name: name, email: email, password: password, confirmPassword: confirmPassword)
    }

    func presentError(_ returnMessage: String) {
        error = true
        message = returnMessage
        isLoading = false
    }

    func presentSuccess() {
        isLoading = false
        success = true
        message = "Email cadastrado com sucesso, por favor verifique sua caixa de email e autentique a sua nova conta!"
        router?.navigateToHome()
    }
}
