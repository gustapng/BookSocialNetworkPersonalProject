//
//  LoginInteractor.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 21/01/25.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

protocol LoginInteractorProtocol {
    func login(email: String, password: String)
    func loginWithGoogle()
}

final class LoginInteractor: LoginInteractorProtocol  {
    weak var presenter: LoginPresenterProtocol?

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
           if let error = error {
               let translatedMessage = handleFirebaseError(error)
               self.presenter?.presentError(translatedMessage)
           } else {
               self.presenter?.loginSuccess()
           }
       }
    }
    
    func loginWithGoogle() {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first?.rootViewController else { return }

            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
                if let error = error {
                    self.presenter?.presentError("Falha ao autenticar com Google.")
                    return
                }

                guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }

                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.accessToken.tokenString)

                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        self.presenter?.presentError("Falha ao autenticar com Firebase.")
                        return
                    }

                    self.presenter?.loginSuccess()
                }
            }
        }
}
