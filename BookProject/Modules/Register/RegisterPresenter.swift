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
    @Published var errorMessage: String? = nil
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

    func presentError(_ message: String) {
        error = true
        errorMessage = message
        isLoading = false
    }

    func presentSuccess() {
        isLoading = false
        router?.navigateToHome()
    }
}
