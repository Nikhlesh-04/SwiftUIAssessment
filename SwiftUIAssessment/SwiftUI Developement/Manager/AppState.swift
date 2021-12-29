//
//  AppState.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation

struct UserS {

    enum UserState {
        case login, isReady
    }

    var state: UserState = .login
}

class AppState: ObservableObject {

    // MARK: - Published Properties
    @Published var user: UserS! = nil

    // MARK: - Init

    init() {
        user = UserS()
        user.state = getUserState()
    }

    // MARK: - Methods
    func getUserState() -> UserS.UserState {

        if Constants.kUserDefaults.string(forKey: UserDefaultsConstants.userState) == nil {
            return .login
        }
        
        return self.loginHandler()
    }
    
    func loginHandler() -> UserS.UserState {
        return .isReady
    }
}
