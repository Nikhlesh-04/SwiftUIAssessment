//
//  RewardInfo.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation

struct RewardInfo: Codable {
    
    var cardNumber: String              = ""
    var cardExpirationDate: String      = ""
    var balance: Double                 = 0.0
    var transactions: [RewardDetail]    = []
    
    var rewardString:String {
        if balance < 0 {
            return "-$\(abs(balance))"
        } else {
            return "$\(abs(balance))"
        }
    }
    
    var expirationDate: Date {
        get { return cardExpirationDate.convertToDate(dateFormat: "YYYY-MM") ?? Date.now}
    }
}
