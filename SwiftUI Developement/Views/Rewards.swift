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
                        Card(cardNumber: model.reward.cardNumber, expireDate: model.reward.expirationString)
                        VStack(alignment: .leading) {
                            Text("Current Balance")
                                .font(.system(size: 20))
                                .bold()
                            
                            CurrentBalance(
                                date: Date.now,
                                balance: model.reward.rewardString
                            )
                        }
                        .padding(.horizontal)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Section(header: Text("Latest Transactions")
                                        .font(.system(size: 20))
                                        .bold()
                                        .padding(.leading)) {
                                List(model.reward.transactions) { transaction in
                                    NavigationLink(destination: RewardDetailView(id: transaction.id, rewardModel: model)){
                                        Transaction(inReward: transaction.bird, name: transaction.title, date: transaction.transectionDate, balance: transaction.rewardString)
                                    }
                                }
                                .onAppear(perform: {
                                    UITableView.appearance().contentInset.top = -30
                                })
                                
                            }
                                        .accessibilityIdentifier(Identifiers.rewardTable)
                        }
                    }
                    .navigationBarTitle("Rewards")
                }
            }
        }
        .padding(.top, 1)
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
