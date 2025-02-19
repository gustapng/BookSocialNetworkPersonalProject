//
//  ForgotPasswordPresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 28/01/25.
//

import Foundation

protocol ForgotPasswordPresenterProtocol: AnyObject {
    func presentError(_ message: String)
    func presentSuccess()
}

final class ForgotPasswordPresenter: ObservableObject, ForgotPasswordPresenterProtocol {
    @Published var error = false
    @Published var success = false
    @Published var message: String? = nil
    @Published var isLoading: Bool = false
    var interactor: ForgotPasswordInteractor?
    var router: ForgotPasswordRouter?

    init(interactor: ForgotPasswordInteractor, router: ForgotPasswordRouter) {
        self.interactor = interactor
    }

    func forgotPassword(email: String) {
        isLoading = true
        interactor?.forgotPassword(email: email)
    }

    func presentError(_ returnMessage: String) {
        error = true
        message = returnMessage
        isLoading = false
    }
    
    func presentSuccess() {
        isLoading = false
        success = true
        message = "Enviamos um e-mail para a recuperação da sua conta. Verifique sua caixa de entrada!"
    }
}
