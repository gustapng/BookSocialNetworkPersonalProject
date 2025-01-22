//
//  WelcomeInteractor.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import Foundation

protocol WelcomeBusinessLogic {
    func advanceStep()
}

final class WelcomeInteractor: WelcomeBusinessLogic {
    private var currentStep: Int = 1
    var presenter: WelcomePresenter?

    func advanceStep() {
        if currentStep < 3 {
            currentStep += 1
            presenter?.presentStep(currentStep)
        }
    }
}
