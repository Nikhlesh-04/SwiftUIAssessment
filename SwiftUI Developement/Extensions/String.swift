//
//  String.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation

extension String {
    func convertToDate(dateFormat formatType: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType
        let serverDate = dateFormatter.date(from:self)
        return serverDate
    }
}
