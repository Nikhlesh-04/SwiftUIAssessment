//
//  RewardDetailViewModel.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import SwiftUI

import Combine
import SwiftUI
import Foundation

final class RewardDetailViewModel: ObservableObject {
    @Published var hudVisible:Bool = true
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    @Published private(set) var rewardDetail = RewardDetail()
    
    var id:String = ""
    
    init() {}
    
    func fetch(id:String) {
        self.id = id
        APIService().getRewardTransectionDetail(id: id, completion: { rewardDetailObject, error in
            self.hudVisible = false
            if let rewardsDetail = rewardDetailObject {
                self.rewardDetail = rewardsDetail
            } else if let error = error {
                self.isErrorShown = true
                self.errorMessage = error.localizedDescription
            }
        })
    }
}
