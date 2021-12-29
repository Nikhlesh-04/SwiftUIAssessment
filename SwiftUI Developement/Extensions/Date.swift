import Foundation

extension Date {
	func format() -> String {
		return self.formatted(date: .abbreviated, time: .omitted)
	}
    
    /// Convert Date to String
    func convertToString(dateformat format: String) -> String {
        
        //let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format //"yyyy-MM-dd HH:mm:ss.SSS"//2014-09-23 15:15:28.252
        let defaultTimeZoneStr = formatter.string(from: self)
        
        return defaultTimeZoneStr
    }
}
