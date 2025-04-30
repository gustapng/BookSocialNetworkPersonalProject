//
//  HomeInteractor.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 19/02/25.
//

import Foundation

protocol HomeInteractorProtocol {
    func fetchBooks()
}

final class HomeInteractor: HomeInteractorProtocol, ObservableObject {
    weak var presenter: HomePresenter?
    private let service: BookServiceProtocol

    init(service: BookServiceProtocol = BookService()) {
        self.service = service
    }

    func fetchBooks() {
        service.fetchRecommendedBooks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self?.presenter?.didFetchBooks(books)
                case . failure(let error):
                    print("Erro ao buscar livros: \(error)")
                }
            }
        }
    }
}
