//
//  WelcomeView.swift
//  BookProject
//
//  Created by Gustavo Ferreira dos Santos on 15/01/25.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var presenter: WelcomePresenter

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Black"))
                    .frame(height: 400)
                
                VStack {
                    Spacer()
                    
                    Image("Illustration-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.top, 36)
                    
                    Spacer()
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("OffWhite"))
                            .frame(width: 30, height: 8)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("Gray"))
                            .frame(width: 8, height: 8)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("Gray"))
                            .frame(width: 8, height: 8)
                    }
                    .padding(.bottom, 16)
                }
                .frame(height: 400)
            }
            .ignoresSafeArea(edges: .top)
            .padding(.bottom, -26)
            
            Text("The standard Lorem Ipsum 1")
                .font(.system(size: 34,weight: .black))
                .frame(maxWidth: 340, alignment: .leading)
                .padding(.horizontal, 26)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.system(size: 14,weight: .medium))
                .frame(maxWidth: 340, alignment: .leading)
                .foregroundStyle(Color("Gray"))
                .padding(.horizontal, 26)
                .padding(.top)
            
            Spacer()
            
            HStack {
                Button {
                    presenter.skipTapped()
                } label: {
                    Text("Pular")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(Color("Gray"))
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Gray"), lineWidth: 2)
                        )
                        
                }
                .layoutPriority(1)
                
                Button {
                    presenter.advanceTapped()
                } label: {
                    Text("Avançar")
                        .font(.system(size: 17, weight: .medium))
                          .foregroundColor(Color("White"))
                          .padding(.vertical, 16)
                          .frame(maxWidth: .infinity)
                          .background(Color("Black"))
                          .cornerRadius(10)
                          .overlay(
                              RoundedRectangle(cornerRadius: 10)
                                  .stroke(Color("Black"), lineWidth: 2)
                          )
                }
                .layoutPriority(1)
            }
            .padding(.horizontal, 26)
            .padding(.bottom, 26)
        }
        .onAppear {
            presenter.viewDidLoad()
        }
    }
}

#Preview {
    let interactor = WelcomeInteractor()
    let router = WelcomeRouter()
    let presenter = WelcomePresenter(interactor: interactor, router: router)

    WelcomeView(presenter: presenter)
}
