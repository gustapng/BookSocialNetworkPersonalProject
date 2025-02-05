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

        // TODO: LOADING DURING THE EXECUTION
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.presenter?.presentError(error.localizedDescription)
            } else {
                self.presenter?.presentSuccess()
            }
        }
    }

    private func validateInputs(name: String, email: String, password: String, confirmPassword: String) -> String? {
        guard !name.isEmpty else {
            return "O nome é obrigatório."
        }

        guard !email.isEmpty else {
            return "O e-mail é obrigatório."
        }

        guard ValidationUtils.isValidEmail(email) else {
            return "O e-mail não é válido."
        }

        guard !password.isEmpty else {
            return "A senha é obrigatória."
        }

        guard password == confirmPassword else {
            return "As senhas não coincidem."
        }

        guard ValidationUtils.isPasswordStrong(password) else {
            return "A senha deve ter pelo menos 8 caracteres e 1 caractere maiúsculo."
        }

       return nil
    }
}
