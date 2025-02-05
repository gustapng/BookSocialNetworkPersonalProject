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
    @Published var errorMessage: String? = nil
    var interactor: RegisterInteractor?
    var router: RegisterRouterProtocol?

    init(interactor: RegisterInteractor, router: RegisterRouter) {
        self.interactor = interactor
    }

    func register(name: String, email: String, password: String, confirmPassword: String) {
        interactor?.register(name: name, email: email, password: password, confirmPassword: confirmPassword)
    }

    func presentError(_ message: String) {
        errorMessage = message
    }

    func presentSuccess() {
        router?.navigateToHome()
    }
}
