//
//  LoginInteractor.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation
import FirebaseAuth

protocol LoginInteractorProtocol {
    func login(email: String, password: String)
}

final class LoginInteractor: LoginInteractorProtocol  {
    weak var presenter: LoginPresenterProtocol?

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
           if let error = error {
               self.presenter?.loginFailed(errorMessage: error.localizedDescription)
           } else {
               self.presenter?.loginSuccess()
           }
       }
    }
}
