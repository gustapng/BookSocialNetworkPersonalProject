//
//  BookProjectApp.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import SwiftUI

@main
struct BookProjectApp: App {
    var body: some Scene {
        WindowGroup {
            let interactor = WelcomeInteractor()
            let router = WelcomeRouter()
            let presenter = WelcomePresenter(interactor: interactor, router: router)

//            interactor.presenter = presenter

            WelcomeView(presenter: presenter, router: router)
        }
    }
}
