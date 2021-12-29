import Combine
import SwiftUI
import Foundation

final class AccountViewModel: ObservableObject {
    @Published var hudVisible:Bool = true
    @Published var isErrorShown = false
    @Published var errorMessage = ""
	@Published private(set) var account = AccountInfo()
    
    init() {fetch()}

	private func fetch() {
        APIService().getAccount { accountObject, error in
            self.hudVisible = false
            if let accounts = accountObject {
                self.account = accounts
            } else if let error = error {
                self.isErrorShown = true
                self.errorMessage = error.localizedDescription
            }
        }
	}
}
