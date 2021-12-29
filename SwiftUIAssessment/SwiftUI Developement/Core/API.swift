//
//  API.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation

enum API:String {
    
    case account                  = "accounts"
    case rewards                  = "rewards"
    case transactions             = "rewards/transactions"
    case transactionDetail        = "rewards/transactions/"
}

extension API : APIRequirement {
    
    static var baseURL: String {
        return "https://ios.rp.devfactory.com/"
    }
    
    var apiHeader: [String : String] {
        return Constants.kHeaders
    }
    
    var apiPath: String {
        return "\(API.baseURL)"
    }
    
    var methodPath: String {
        return self.rawValue
    }
}
