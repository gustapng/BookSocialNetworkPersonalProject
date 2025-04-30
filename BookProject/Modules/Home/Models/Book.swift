//
//  Book.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 29/04/25.
//

struct BookResponse: Decodable {
    let items: [BookItem]
}

struct BookItem: Decodable, Identifiable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let authors: [String]?
    let imageLinks: ImageLinks?
    let averageRating: Double?

    var secureThumbnailURL: String? {
        imageLinks?.thumbnail.replacingOccurrences(of: "http://", with: "https://")
    }
}

struct ImageLinks: Decodable {
    let thumbnail: String
}
