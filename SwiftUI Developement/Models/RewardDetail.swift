//
//  Reward.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation

struct RewardDetail: Codable, Identifiable {
    var id: String          = ""
    var title: String       = ""
    var date: String        = ""
    var amount: Double      = 0.0
    var bird: Bool          = false
    var status: String?     = ""
    
    var rewardString:String {
        if amount < 0 {
            return "-$\(abs(amount))"
        } else {
            return "$\(abs(amount))"
        }
    }
    
    var rewardDate: Date {
        get { return date.convertToDate(dateFormat: "YYYY-MM-DD") ?? Date.now}
    }
    
    var transectionDate: String {
        get { return rewardDate.convertToString(dateformat: "MMM DD,YYYY")}
    }
}
