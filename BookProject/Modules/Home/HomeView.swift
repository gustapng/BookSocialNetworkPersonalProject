//
//  HomeView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 19/02/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    var router: HomeRouter

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let interactor = HomeInteractor()
    let router = HomeRouter()
    let presenter = HomePresenter(interactor: interactor, router: router)

    interactor.presenter = presenter

    return HomeView(presenter: presenter, router: router)
}
