//
//  Constants.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation
import SwiftUI

public struct Constants {
    
    static let kUserDefaults        = UserDefaults.standard

    static let kScreenWidth         = UIScreen.main.bounds.width
    static let kScreenHeight        = UIScreen.main.bounds.height
    
    static let kHeaders = ["Content-Type": "application/json"]
    
    static let typeSizes: [DynamicTypeSize] = [
        .xSmall,
        .large,
        .xxxLarge
    ]
    
    static func setupAppearance(colorScheme:ColorScheme) {
        ColourStyle.shared.colorScheme = colorScheme
    }
}

public struct UserDefaultsConstants {
    static let userState = "UserState"
}

// MARK: - Web Service Constans Objects.
public struct ApiConstants {
    static let apiTimeoutTime =  60 //Seconds.
}

// MARK: - Error Messages Objects.
public struct ConstantsMessages {

    static let kInReward        = "Congratulations on earning your bird!"
    static let kOutReward       = "We are sorry on lose your bird!"
    
    static let welcomeText      = "Welcome to Rewards"
}

public struct Identifiers {
    
    static let rewardTable          = "reward_table_view"
    static let rewardDetailTable    = "rewardDetail_table_view"
    static let accountTable         = "account_table_view"
}
