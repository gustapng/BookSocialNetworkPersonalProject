//
//  LoginInteractor.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 27/01/25.
//

import Foundation
import FirebaseCore
import FirebaseAuth

protocol RegisterInteractorProtocol {
    func register(name: String, email: String, password: String, confirmPassword: String)
}

final class RegisterInteractor: RegisterInteractorProtocol {
    weak var presenter: RegisterPresenterProtocol?

    func register(name: String, email: String, password: String, confirmPassword: String) {
        if let errorMessage = validateInputs(name: name, email: email, password: password, confirmPassword: confirmPassword) {
            presenter?.presentError(errorMessage)
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let translatedMessage = handleFirebaseError(error)
                self.presenter?.presentError(translatedMessage)
            } else {
                self.presenter?.presentSuccess()
            }
        }
    }

    private func validateInputs(name: String, email: String, password: String, confirmPassword: String) -> String? {
        guard !name.isEmpty else {
            return "Por favor preencha o campo de nome."
        }

        guard !email.isEmpty else {
            return "Por favor preencha o campo de e-mail."
        }

        guard !password.isEmpty else {
            return "Por favor preencha o campo de senha."
        }

        guard password == confirmPassword else {
            return "As senhas não coincidem."
        }

       return nil
    }
}
