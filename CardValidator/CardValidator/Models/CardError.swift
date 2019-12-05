//
//  CardError.swift
//  
//
//  Created by Anton Boyarkin on 04/12/2019.
//

import Foundation

public enum CardError: LocalizedError {
    case unsupported
    case invalidLength
    case leadingZero
    case notNumeric
    case invalid
    
    public var errorDescription: String? {
        return self.localizedDescription
    }
    
    public var localizedDescription: String {
        switch self {
        case .unsupported: return "Unsupported"
        case .invalidLength: return "Card number must be 12-19 digits long"
        case .leadingZero: return "No leading 0"
        case .notNumeric: return "Must contains only numbers"
        case .invalid: return "Invalid card number"
        }
    }
}
