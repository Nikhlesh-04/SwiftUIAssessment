import SwiftUI

struct MainContainer: View {
    
    @EnvironmentObject var state: AppState
    @State var hudConfig = LoadingViewConfig()
    
    var body: some View {
        TabView {
            Rewards()
                .tabItem {
                    Label("Rewards", image: ConstantImage.rewardIcon)
                }
            Account()
                .tabItem {
                    Label("Account", systemImage: ConstantImage.personCircle)
                }
        }
    }
}

struct MainContainer_Previews: PreviewProvider {

	static var previews: some View {
		Group {
			ForEach(Constants.typeSizes, id: \.self) { size in
				MainContainer()
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			MainContainer()
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
    }
}
