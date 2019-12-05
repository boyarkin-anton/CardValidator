//
//  CardType.swift
//  
//
//  Created by Anton Boyarkin on 04/12/2019.
//

import Foundation

@objc
public enum CardType: Int, CaseIterable {
    case visaElectron
    case visa
    case mastercard
    case maestro
    case americanExpress
    case dinnersClub
    case discovery
    case jcb
    case unionpay
    
    case unknown
}

public extension CardType {
    var regex: String {
        switch self {
        case .visaElectron: return "^(4026|4175|4405|4508|4844|4913|4917)\\d{12}$"
        case .visa: return "^4[0-9]{12}(?:[0-9]{3})?$"
        case .mastercard: return "^5[1-5][0-9]{14}$|^2(?:2(?:2[1-9]|[3-9][0-9])|[3-6][0-9][0-9]|7(?:[01][0-9]|20))[0-9]{12}$"
        case .maestro: return "^(5018|5081|5044|5020|5038|603845|6304|6759|676[1-3]|6799|6220|504834|504817|504645)[0-9]{8,15}$"
        case .americanExpress: return "^3[47][0-9]{13}$"
        case .dinnersClub: return "^3(?:0[0-5]|[68][0-9])[0-9]{11}$"
        case .discovery: return "^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$"
        case .jcb: return "^(?:2131|1800|35[0-9]{3})[0-9]{11}$"
        case .unionpay: return "^62[0-5]\\d{13,16}$"
            
        default: return ""
        }
    }
    
    var name: String {
        switch self {
        case .visaElectron: return "Visa Electron"
        case .visa: return "Visa"
        case .mastercard: return "Mastercard"
        case .maestro: return "Maestro"
        case .americanExpress: return "American Express"
        case .dinnersClub: return "Diner's Club"
        case .discovery: return "Discover"
        case .jcb: return "JCB"
        case .unionpay: return "China Union Pay"
            
        default: return "Unknown"
        }
    }
}
