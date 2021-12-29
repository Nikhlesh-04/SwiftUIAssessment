import SwiftUI

@main
struct SwiftUI: App {
    
    let state = AppState()
    let dispatchView = DispatchView()

    var body: some Scene {
        WindowGroup {
            dispatchView.environmentObject(state)
        }
    }
}
