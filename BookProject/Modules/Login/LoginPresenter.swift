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
    func loginSuccess()
}

final class LoginPresenter: ObservableObject, LoginPresenterProtocol {
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol

    @Published var navigateToHome = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var error = false
    @Published var success = false
    @Published var message: String? = nil

    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func login(email: String, password: String) {
        self.isLoading = true
        self.errorMessage = nil
        self.interactor.login(email: email, password: password)
    }

    func loginSuccess() {
        // TODO: RESOLVE NAVIGATION TO HOME
        print("sucesso")
        DispatchQueue.main.async {
            self.isLoading = false
            self.navigateToHome = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.navigateToHome = false
            }
        }
    }
    
    func presentError(_ returnMessage: String) {
        self.error = true
        self.message = returnMessage
        self.isLoading = false
    }
}
