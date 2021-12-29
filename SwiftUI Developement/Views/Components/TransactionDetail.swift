import SwiftUI

struct TransactionDetail: View {
    var inReward: Bool
    var name: String
    var balance: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(inReward ? "InReward" : "Outflow")
            Text(name)
            Text(balance)
                .bold()
                .font(.title)
            Text(inReward ? ConstantsMessages.kInReward : ConstantsMessages.kOutReward)
                .bold()
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(inReward ? Color(ColourStyle.shared.inReward) : ColourStyle.shared.outReward)
        .cornerRadius(12)  // Inner corner radius
        .shadow(color: .black, radius: 2, x: 0, y: 2)
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
