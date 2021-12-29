import Foundation

extension Date {
	func format() -> String {
		return self.formatted(date: .abbreviated, time: .omitted)
	}
}
