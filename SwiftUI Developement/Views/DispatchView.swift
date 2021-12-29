//
//  DispatchView.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import SwiftUI

struct DispatchView: View {

    @EnvironmentObject var state: AppState
    @Environment(\.colorScheme) var colorScheme

    // MARK: - Body

    var body: some View {
        Constants.setupAppearance(colorScheme: colorScheme)
        switch state.user.state {
            case .login:
                return AnyView(Login().environmentObject(state))

            case .isReady:
                return AnyView(MainContainer().environmentObject(state))

        }
        
    }
}

