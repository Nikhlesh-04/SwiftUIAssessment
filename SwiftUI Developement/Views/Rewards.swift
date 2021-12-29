//
//  Rewards.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import SwiftUI

struct Rewards: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject private var model = RewardViewModel()
    @State var hudConfig = LoadingViewConfig()
    
    var body: some View {
        VStack {
            LoadingView(isShowing: $model.hudVisible, config: hudConfig) {
                NavigationView {
                    VStack {
                        CurrentBalance(
                            date: Date.now,
                            balance: model.reward.rewardString
                        )
                            .padding(.vertical,Constants.kScreenHeight * 0.08)
                        
                        List(model.reward.transactions) { transaction in
                            ZStack {
                                TransactionDetail(inReward: transaction.bird, name: transaction.title, balance: transaction.rewardString)
                                NavigationLink(destination: RewardDetailView(id: transaction.id, rewardModel: model)){
                                }.frame(width: 0, height: 0)
                            }
                            .listRowSeparator(.hidden)
                        }
                        .accessibilityIdentifier(Identifiers.rewardTable)
                        .listStyle(.plain)
                    }
                    .navigationBarHidden(true)
                    .background(
                        ColourStyle.shared.yellowBackgorudLinearGradient)
                    .edgesIgnoringSafeArea([.top])
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Constants.typeSizes, id: \.self) { size in
                Rewards()
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            Rewards()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }.previewLayout(.sizeThatFits)
    }
}
