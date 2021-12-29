import SwiftUI

struct CurrentBalance: View {
	var date: Date
	var balance: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Balance as of \(date.format())")
                .foregroundColor(Color(.systemGray))
            Text(balance)
                .bold()
                .font(.title)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct CurrentBalance_Previews: PreviewProvider {

	static var previews: some View {
		Group {
			ForEach(Constants.typeSizes, id: \.self) { size in
				CurrentBalance(
					date: Date.now,
                    balance: 139.47.rewardString
				)
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			CurrentBalance(
				date: Date.now,
                balance: 139.47.rewardString
			)
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
