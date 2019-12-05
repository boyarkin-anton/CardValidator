//
//  Extensions.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 05/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import UIKit
import CardValidator

extension CardType {
    var image: UIImage {
        switch self {
        case .visa: return #imageLiteral(resourceName: "Visa")
        case .visaElectron: return #imageLiteral(resourceName: "VisaElectron")
        case .mastercard: return #imageLiteral(resourceName: "Mastercard")
        case .maestro: return #imageLiteral(resourceName: "Maestro")
        case .americanExpress: return #imageLiteral(resourceName: "American-Express")
        case .discovery: return #imageLiteral(resourceName: "Discover")
        case .dinnersClub: return #imageLiteral(resourceName: "DinersClub")
        case .jcb: return #imageLiteral(resourceName: "JCB")
        case .unionpay: return #imageLiteral(resourceName: "UnionPay")
        default: return #imageLiteral(resourceName: "credit-card")
        }
    }
    
    static var filter: [CardType] {
        return [.visa, .mastercard, .jcb, .unknown]
    }
}

extension CardValidity {
    var name: String {
        switch self {
        case .invalid: return "Invalid"
        case .valid: return "Valid"
        default: return "Any"
        }
    }
}
