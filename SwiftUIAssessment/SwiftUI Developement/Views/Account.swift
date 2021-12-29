import SwiftUI
import Combine

struct Account: View {
    @ObservedObject var model = AccountViewModel()
    @EnvironmentObject var state: AppState
    
    @State var hudConfig = LoadingViewConfig()    

    var body: some View {
        LoadingView(isShowing: $model.hudVisible, config: hudConfig) {
            NavigationView {
                VStack(alignment: .leading, spacing: 12) {
                    List() {
                        Section {
                            UserInfoItem(account: model.account)
                        }
                        Section {
                            KeyValueListItem(
                                key: "Student ID",
                                value: model.account.details.studentID
                            )
                            KeyValueListItem(
                                key: "Campus ID",
                                value: model.account.details.campusID
                            )
                            KeyValueListItem(
                                key: "GT Level",
                                value: model.account.details.level)
                            KeyValueListItem(
                                key: "MAP Grade Level",
                                value: model.account.details.mapGradeLevel.ordinal()
                            )
                            KeyValueListItem(
                                key: "House",
                                value: model.account.details.house
                            )
                        }
                    }
                    .accessibilityIdentifier(Identifiers.accountTable)
                    .listStyle(.insetGrouped)
                    .alert(isPresented: $model.isErrorShown, content: { () -> Alert in
                        Alert(title: Text("Error"), message: Text(model.errorMessage))
                    })
                    VStack {
                        Button(action: {
                            print("First button is tapped")
                            Constants.kUserDefaults.removeObject(forKey: UserDefaultsConstants.userState)
                            state.user.state = .login
                        }) {
                            Text("Logout")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.blue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    }.padding()
                }.background(Color(.systemBackground))
                    .navigationTitle("Account")
            }
        }
    }
}

struct Account_Previews: PreviewProvider {
	static var previews: some View {
		Group {
            ForEach(Constants.typeSizes, id: \.self) { size in
				Account()
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			Account()
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
