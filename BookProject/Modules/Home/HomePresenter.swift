//
//  HomePresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 19/02/25.
//

import Foundation

final class HomePresenter: ObservableObject {
    private let interactor: HomeInteractor
    private let router: HomeRouter

    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }
}
