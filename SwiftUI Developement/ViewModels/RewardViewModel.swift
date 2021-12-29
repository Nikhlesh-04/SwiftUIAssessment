//
//  RewardViewModel.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Combine
import SwiftUI
import Foundation

final class RewardViewModel: ObservableObject {
    @Published var hudVisible:Bool = true
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    @Published private(set) var reward = RewardInfo()
    
    init() {fetch()}

    private func fetch() {
        APIService().getRewardsInfo { rewardObject, error in
            self.hudVisible = false
            if var rewards = rewardObject {
                // Chronological order
                rewards.transactions = rewards.transactions.sorted {$0.rewardDate < $1.rewardDate}
                self.reward = rewards
            } else if let error = error {
                self.isErrorShown = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
