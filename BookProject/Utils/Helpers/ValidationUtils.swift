//
//  Validation.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 04/02/25.
//

import Foundation

struct ValidationUtils {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    static func isPasswordStrong(_ password: String) -> Bool {
        guard password.count >= 8 else {
            return false
        }

        let uppercaseRegex = ".*[A-Z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", uppercaseRegex).evaluate(with: password) else {
            return false
        }

        return true
    }
}
