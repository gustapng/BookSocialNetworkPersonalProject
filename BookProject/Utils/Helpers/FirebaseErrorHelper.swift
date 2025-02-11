//
//  FirebaseErrorHelper.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 10/02/25.
//

import Firebase
import FirebaseCore
import FirebaseAuth

func handleFirebaseError(_ error: Error) -> String {
    let nsError = error as NSError
    print(error)
    if let errorCode = AuthErrorCode(rawValue: nsError.code) {
        let errorMessages: [AuthErrorCode: String] = [
            .emailAlreadyInUse: "Este email já está sendo usado por outra conta. Tente outro email ou faça login.",
            .invalidEmail: "O email fornecido não é válido.",
            .weakPassword: "A senha fornecida é muito fraca. Tente uma senha mais forte.",
            .wrongPassword: "Senha incorreta. Tente novamente.",
            .userNotFound: "Nenhuma conta encontrada com esse email.",
            .networkError: "Erro de rede. Verifique sua conexão com a internet.",
            .operationNotAllowed: "O serviço não está habilitado. Tente novamente mais tarde.",
        ]
        
        if let errorMessage = errorMessages[errorCode] {
            return errorMessage
        }
    }
    
    return "Ocorreu um erro inesperado. Tente novamente."
}
