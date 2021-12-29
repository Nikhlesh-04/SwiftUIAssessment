import SwiftUI

struct TransactionDetail: View {
    var inReward: Bool
    var name: String
    var balance: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(inReward ? ConstantImage.inflow : ConstantImage.outflow)
            Text(name)
            Text(balance)
                .bold()
                .font(.title)
            Text(inReward ? ConstantsMessages.kInReward : ConstantsMessages.kOutReward)
                .bold()
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
        }
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(ColourStyle.shared.systemBackground)
        .cornerRadius(12)  // Inner corner radius
    }
}

struct TransactionDetail_Previews: PreviewProvider {

	static var previews: some View {
		Group {
			ForEach(Constants.typeSizes, id: \.self) { size in
                TransactionDetail(inReward: false, name: "Starbucks", balance: (-10.54).rewardString)
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
            TransactionDetail(inReward: false, name: "Starbucks", balance: (-10.54).rewardString)
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
