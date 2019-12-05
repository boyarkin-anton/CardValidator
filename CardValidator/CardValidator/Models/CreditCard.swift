//
//  CreditCard.swift
//  
//
//  Created by Anton Boyarkin on 04/12/2019.
//

import Foundation

public class CreditCard: NSObject {
    @objc
    public let number: String
    
    @objc
    public lazy var isValid: Bool = {
        do {
            try validate()
        } catch {
            print(error.localizedDescription)
            return false
        }
        
        return true
    }()
    
    @objc
    public lazy var network: CardType = {
        for type in CardType.allCases {
            let predicate = NSPredicate(format: "SELF MATCHES %@", type.regex)
            
            if predicate.evaluate(with: number.getNumbersOnly()) == true {
                return type
            }
        }
        return .unknown
    }()
    
    @objc
    public init(_ number: String) {
        self.number = number
    }
    
    @objc
    public func validate() throws {
        try CardValidator().validate(number)
    }
}
