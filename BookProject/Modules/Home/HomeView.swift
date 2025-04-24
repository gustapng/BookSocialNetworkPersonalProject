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
            VStack {
                HStack {
                    Text("Olá, Usuário")
                        .font(AppFonts.title)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Orange"))
                }
                .padding(.top, AppSpacing.medium)

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
            }
            .padding(.bottom, AppSpacing.large)

            VStack {
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

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...4, id: \.self) { _ in
                            NavigationLink(destination: router.navigateToHome()) {
                                VStack(alignment: .leading) {
                                    Image("book")
                                        .resizable()
                                        .frame(width: 118, height: 169)
                                        .cornerRadius(5)
                                        .overlay(
                                            HStack(spacing: 6) {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(AppColors.orange)
                                                    .frame(width: 15, height: 15)

                                                Text("5.0")
                                                    .foregroundColor(AppColors.orange)
                                                    .font(.caption)
                                            }
                                            .padding(6)
                                            .background(Color.white)
                                            .cornerRadius(5)
                                            .shadow(radius: 2)
                                            .padding(.leading, AppSpacing.small)
                                            .padding(.bottom, AppSpacing.small),
                                            alignment: .bottomLeading
                                        )

                                    Text("Sapiens - Uma Breve História da humanidade")
                                        .font(AppFonts.bookTitle)
                                        .frame(width: 118, alignment: .leading)
                                        .lineLimit(2)
                                        .truncationMode(.tail)
                                        .padding(.vertical, AppSpacing.extraSmall)

                                    Text("Yuval Noah Harari")
                                        .font(AppFonts.bookDescription)
                                        .foregroundColor(AppColors.darkGray)
                                        .frame(width: 118, alignment: .leading)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }

                Spacer()
            }
        }
        .padding(.horizontal, AppSpacing.large)
    }
}

#Preview {
    let interactor = HomeInteractor()
    let router = HomeRouter()
    let presenter = HomePresenter(interactor: interactor, router: router)

    interactor.presenter = presenter

    return HomeView(presenter: presenter, router: router)
}
