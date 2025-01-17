//
//  WelcomePresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import Foundation

class WelcomePresenter: ObservableObject {
    private var interactor: WelcomeInteractor
    private var router: WelcomeRouter
    
    init(interactor: WelcomeInteractor, router: WelcomeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
    
    func skipTapped() {
//        router.navigateToLogin()
    }

    func advanceTapped() {
//        router.navigateToNextScreen()
    }
}
