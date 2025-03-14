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
    @State private var search: String = ""

    var body: some View {
        NavigationStack {
            HStack {
                Text("Olá, Usuário")
                    .font(AppFonts.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("Orange"))
            }

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)

                TextField("Busque por Livros, Autores...", text: $search)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("Gray"), lineWidth: 1)
            )
            
            VStack(spacing: 20) {
                HStack {
                    Text("Descubra")
                        .font(AppFonts.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    NavigationLink(destination: router.navigateToHome()) {
                        Text("Ver Mais")
                            .foregroundColor(AppColors.blue)
                            .font(AppFonts.body)
                    }
                }
            }
        }
    }
}

#Preview {
    let interactor = HomeInteractor()
    let router = HomeRouter()
    let presenter = HomePresenter(interactor: interactor, router: router)

    interactor.presenter = presenter

    return HomeView(presenter: presenter, router: router)
}
