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
            VStack {
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
                            .transition(.opacity)
                            .id(presenter.currentStep)
                            .padding(.top, AppSpacing.extraLarge)

                        Spacer()

                        HStack {
                            ForEach(1...3, id: \.self) { step in
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(presenter.currentStep == step ? Color("OffWhite") : Color("Gray"))
                                    .frame(width: presenter.currentStep == step ? 30 : 8, height: 8)
                            }
                        }
                        .padding(.bottom, AppSpacing.medium)
                    }
                    .frame(height: 400)
                }
                .ignoresSafeArea(edges: .top)
                .padding(.bottom, -AppSpacing.large)

                VStack(spacing: AppSpacing.medium) {
                    Text(presenter.title)
                        .font(AppFonts.welcomeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .transition(.opacity)
                        .id("title-\(presenter.currentStep)")

                    Text(presenter.description)
                        .font(AppFonts.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(AppColors.gray)
                        .transition(.opacity)
                        .id("description-\(presenter.currentStep)")
                }
                .padding(.horizontal, AppSpacing.large)

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
                .padding(.horizontal, AppSpacing.large)
                .padding(.bottom, AppSpacing.large)
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                router.navigateToLoginView()
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
