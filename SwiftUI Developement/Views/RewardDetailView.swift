//
//  RewardDetail.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import SwiftUI

struct RewardDetailView: View {
    
    /*
     NOTE:- Here we can also get reward detail from last Reward view, so here no need to call api for get reward detail on appear view
     
        But for get latest updated info about reward here I call api
     
     */
    
    
    @ObservedObject private var model =  RewardDetailViewModel()
    @State var hudConfig = LoadingViewConfig()
    
    var id:String
    var rewardModel:RewardViewModel
    
    var body: some View {
        LoadingView(isShowing: $model.hudVisible, config: hudConfig) {
            VStack {
                TransactionDetail(inReward: model.rewardDetail.bird, name: model.rewardDetail.title, balance: model.rewardDetail.rewardString)
                    .padding()
                
                VStack(alignment: .leading) {
                    Section(header: Text("Transaction Details")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading)) {
                        
                        List() {
                            KeyValueListItem(
                                key: "Status",
                                value: model.rewardDetail.status
                            )
                            
                            KeyValueListItem(
                                key: "Date",
                                value: model.rewardDetail.transectionDate
                            )
                        }
                        .accessibilityIdentifier(Identifiers.rewardDetailTable)
                        .navigationBarTitle("Transaction Detail", displayMode: .inline)
                        .onAppear {
                            model.fetch(id: self.id)
                        }
                    }
                }
            }
        }
    }
}

struct RewardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Constants.typeSizes, id: \.self) { size in
                RewardDetailView(id: "", rewardModel: RewardViewModel())
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            RewardDetailView(id: "", rewardModel: RewardViewModel())
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }.previewLayout(.sizeThatFits)
    }
}
