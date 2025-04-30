//
//  HomePresenter.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 19/02/25.
//

import Foundation

protocol HomePresenterProtocol {
    func didFetchBooks(_ books: [BookItem])
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    @Published var books: [BookItem]  = []
    private let interactor: HomeInteractor
    private let router: HomeRouter

    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }

    func onAppear() {
        interactor.fetchBooks()
    }

    func didFetchBooks(_ books: [BookItem]) {
        self.books = books
    }
}
