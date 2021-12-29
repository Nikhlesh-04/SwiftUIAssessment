//
//  Double.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import Foundation

extension Double {
    func roundToPlaces(places:Int) -> Double {
        let multiplier = pow(10, Double(places))
        return Darwin.round(self * multiplier) / multiplier
    }
    
    var string:String {
        get {return "\(self)"}
    }
    
    var rewardString:String {
        if self < 0 {
            return "-$\(abs(self))"
        } else {
            return "$\(abs(self))"
        }
    }
}

