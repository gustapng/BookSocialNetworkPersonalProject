//
//  ForgotPasswordInteractor.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 28/01/25.
//

import Foundation
import FirebaseCore
import FirebaseAuth

protocol ForgotPasswordInteractorProtocol {
    func forgotPassword(email: String)
}

final class ForgotPasswordInteractor: ForgotPasswordInteractorProtocol {
    weak var presenter: ForgotPasswordPresenterProtocol?

    func forgotPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                let translatedMessage = handleFirebaseError(error)
                self.presenter?.presentError(translatedMessage)
            } else {
                self.presenter?.presentSuccess()
            }
        }
    }
}
