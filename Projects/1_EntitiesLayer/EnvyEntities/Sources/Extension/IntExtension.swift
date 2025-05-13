//
//  IntExtension.swift
//  EnvyEntities
//
//  Created by 강지윤 on 4/25/25.
//
import Foundation

public extension Int {
    func toDecimalFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return formattedString
        }
        return "\(self)"
    }
}
