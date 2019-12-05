//
//  CardInfo.swift
//  
//
//  Created by Anton Boyarkin on 05/12/2019.
//

import Foundation

public class CardInfo: NSObject, Codable {
    @objc public var scheme: String?
    @objc public var type: String?
    @objc public var brand: String?
    public var prepaid: Bool?
    @objc public var country: County?
    @objc public var bank: Bank?
}

public class County: NSObject, Codable {
    @objc public var numeric: String?
    @objc public var alpha2: String?
    @objc public var name: String?
    @objc public var emoji: String?
    @objc public var currency: String?
    public var latitude: Decimal?
    public var longitude: Decimal?
}

public class Bank: NSObject, Codable {
    @objc public var name: String?
    @objc public var url: String?
    @objc public var phone: String?
    @objc public var city: String?
}
