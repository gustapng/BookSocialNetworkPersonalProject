//
//  BookProjectApp.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct BookProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            welcomeView()
        }
    }

    private func welcomeView() -> WelcomeView {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interactor: interactor, router: router)

        interactor.presenter = presenter

        return WelcomeView(presenter: presenter, router: router)
    }
}
