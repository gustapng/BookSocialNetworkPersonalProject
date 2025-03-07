//
//  LoginPresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func presentError(_ message: String)
    func login(email: String, password: String)
    func loginWithGoogle()
    func loginSuccess()
}

final class LoginPresenter: ObservableObject, LoginPresenterProtocol {
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var error = false
    @Published var success = false
    @Published var message: String?

    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func login(email: String, password: String) {
        self.isLoading = true
        self.errorMessage = nil
        interactor.login(email: email, password: password)
    }

    func loginWithGoogle() {
        interactor.loginWithGoogle()
    }

    func loginSuccess() {
        self.isLoading = false
        self.success = true
    }
    
    func presentError(_ returnMessage: String) {
        self.error = true
        self.message = returnMessage
        self.isLoading = false
    }
}
