//
//  String+Extension.swift
//  
//
//  Created by Anton Boyarkin on 04/12/2019.
//

import Foundation

public extension String {
    func luhnCheck() -> Bool {
        let validator = CardValidator()
        return validator.luhnCheck(self.getNumbersOnly())
    }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " "]
        return Set(self).isSubset(of: nums)
    }
    
    var numbersOnly: String? {
        guard isNumeric else { return nil }
        return getNumbersOnly()
    }
    
    func getNumbersOnly() -> String {
        let set = CharacterSet.decimalDigits.inverted
        let numbers = self.components(separatedBy: set)
        return numbers.joined(separator: "")
    }
}
