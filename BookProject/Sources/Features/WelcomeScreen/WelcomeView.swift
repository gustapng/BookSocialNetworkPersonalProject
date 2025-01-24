//
//  WelcomeView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var presenter: WelcomePresenter
    @State private var navigateToLogin = false
    var router: WelcomeRouter

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Black"))
                        .frame(height: 400)

                    VStack {
                        Spacer()

                        Image("Illustration-\(presenter.currentStep)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding(.top, 36)

                        Spacer()

                        HStack {
                            ForEach(1...3, id: \.self) { step in
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(presenter.currentStep == step ? Color("OffWhite") : Color("Gray"))
                                    .frame(width: presenter.currentStep == step ? 30 : 8, height: 8)
                            }
                        }
                        .padding(.bottom, 16)
                    }
                    .frame(height: 400)
                }
                .ignoresSafeArea(edges: .top)
                .padding(.bottom, -26)

                Text(presenter.title)
                    .font(.system(size: 34,weight: .black))
                    .frame(maxWidth: 340, alignment: .leading)
                    .padding(.horizontal, 26)

                Text(presenter.description)
                    .font(.system(size: 14,weight: .medium))
                    .frame(maxWidth: 340, alignment: .leading)
                    .foregroundStyle(Color("Gray"))
                    .padding(.horizontal, 26)
                    .padding(.top)

                Spacer()

                HStack {
                    if presenter.shouldShowSkipButton {
                        CustomOutlinedButton(title: "Pular") {
                            navigateToLogin = true
                        }
                    }

                    CustomButton(title: "Avançar") {
                        if presenter.shouldShowSkipButton {
                            presenter.interactor?.advanceStep()
                        } else {
                            navigateToLogin = true
                        }
                    }
                }
                .padding(.horizontal, 26)
                .padding(.bottom, 26)
            }
            .onAppear {
                presenter.viewDidLoad()
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
}

#Preview {
    let interactor = WelcomeInteractor()
    let router = WelcomeRouter()
    let presenter = WelcomePresenter(interactor: interactor, router: router)

    interactor.presenter = presenter

    return WelcomeView(presenter: presenter, router: router)
}
