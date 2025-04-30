//
//  BookService.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 29/04/25.
//

import Foundation

protocol BookServiceProtocol {
    func fetchRecommendedBooks(completion: @escaping (Result<[BookItem], Error>) -> Void)
}

final class BookService: BookServiceProtocol {
    func fetchRecommendedBooks(completion: @escaping (Result<[BookItem], Error>) -> Void) {
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=bestsellers&langRestrict=pt&orderBy=relevance&maxResults=10"

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(BookResponse.self, from: data)
                completion(.success(decoded.items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
