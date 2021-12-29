import SwiftUI

struct KeyValueListItem: View {
	var key: String;
	var value: String?;
	var truncation: Text.TruncationMode? = .head;

    var body: some View {
		HStack {
			Text(key)
			Spacer(minLength: 32)
			Text(value ?? "")
				.lineLimit(1)
                .redacted(reason: .privacy)
				.truncationMode(truncation!)
		}
    }
}

struct KeyValueListItem_Previews: PreviewProvider {

	static var previews: some View {
		Group {
			ForEach(Constants.typeSizes, id: \.self) { size in
				KeyValueListItem(
					key: "House",
					value: "House of Waterloo",
					truncation: .middle
				)
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			KeyValueListItem(
				key: "Student ID",
				value: "8585"
			)
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
