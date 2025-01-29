//
//  WelcomePresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import Foundation
import SwiftUI

protocol WelcomePresentationLogic {
    func presentStep(_ step: Int)
}

final class WelcomePresenter: ObservableObject, WelcomePresentationLogic {
    @Published var title: String = "Bem-vindo ao nosso App!"
    @Published var description: String = "Descubra uma nova maneira de gerenciar seus livros favoritos com o nosso app inovador."
    @Published var currentStep: Int = 1
    var interactor: WelcomeInteractor?

    init(interactor: WelcomeInteractor, router: WelcomeRouter) {
        self.interactor = interactor
    }

    public func presentStep(_ step: Int) {
        withAnimation(.easeInOut(duration: 0.5)) {
            self.currentStep = step

            switch step {
                case 2:
                    title = "Explore novas possibilidades"
                    description = "Organize, avalie e compartilhe suas leituras com outros amantes de livros."
                case 3:
                    title = "Pronto para começar?"
                    description = "Vamos juntos explorar o universo da leitura. Está pronto para a jornada?"
                default:
                    break
            }
        }
    }
    
    var shouldShowSkipButton: Bool {
        return currentStep < 3
    }

    func viewDidLoad() {
        
    }
}
