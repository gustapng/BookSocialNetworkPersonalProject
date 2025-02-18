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
    if let errorCode = AuthErrorCode(rawValue: nsError.code) {
        let errorMessages: [AuthErrorCode: String] = [
            .emailAlreadyInUse: "Este email já está sendo usado por outra conta. Tente outro email ou faça login.",
            .invalidEmail: "Por favor verifique o email, o e-mail passado é inválido.",
            .weakPassword: "A senha deve ter pelo menos 8 caracteres e 1 caractere maiúsculo.",
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
