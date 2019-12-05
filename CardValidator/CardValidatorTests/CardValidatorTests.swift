//
//  CardValidatorTests.swift
//  CardValidatorTests
//
//  Created by Anton Boyarkin on 05/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import XCTest
@testable import CardValidator

class CardValidatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSampleData() {
        var card = CreditCard("4929804463622139")
        XCTAssertEqual(card.isValid, true)
        XCTAssertEqual(card.network, CardType.visa)
        
        card = CreditCard("4929804463622138")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.visa)
        
        card = CreditCard("6762765696545485")
        XCTAssertEqual(card.isValid, true)
        XCTAssertEqual(card.network, CardType.maestro)
        
        card = CreditCard("5212132012291762")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.mastercard)
        
        card = CreditCard("6210948000000029")
        XCTAssertEqual(card.isValid, true)
        XCTAssertEqual(card.network, CardType.unionpay)
    }
    
    func testFormat() {
        var card = CreditCard("4929804463622139")
        XCTAssertEqual(card.isValid, true)
        XCTAssertEqual(card.network, CardType.visa)
        
        card = CreditCard("4929 8044 6362 2139")
        XCTAssertEqual(card.isValid, true)
        XCTAssertEqual(card.network, CardType.visa)
    }
        
    func testInvalidStates() {
        // Invalid Luhn check
        var card = CreditCard("1234567891234567")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.unknown)
        
        // Numeric check
        card = CreditCard("4929 abcd 6362 2139")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.unknown)
        
        // Leaden 0 check
        card = CreditCard("0929804463622139")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.unknown)
        
        // Less then 12 numbers
        card = CreditCard("4929 8044 636")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.unknown)
        
        // More then 19
        card = CreditCard("4929 8044 6362 2139 1234")
        XCTAssertEqual(card.isValid, false)
        XCTAssertEqual(card.network, CardType.unknown)
    }
    
    func testValidator() {
        let validator = CardValidator()
        
        XCTAssertEqual(validator.isValid("4929804463622139"), true)
        XCTAssertEqual(validator.isValid("4929804463622138"), false)
        
        let cardNumbers = [
            "4929804463622139",
            "4929804463622138",
            "6762765696545485",
            "4012111111111111",
            "378282246310005",
            "371449635398431",
            "378734493671000",
            "5610591081018250",
            "30569309025904",
            "4111111111111111"
        ]
        
        var filtredCards = validator.filter(list: cardNumbers, validity: .valid, network: .visa)
        XCTAssertEqual(filtredCards.count, 3)
        
        filtredCards = validator.filter(list: cardNumbers, validity: .valid)
        XCTAssertEqual(filtredCards.count, 9)
        
        filtredCards = validator.filter(list: cardNumbers, network: .visa)
        XCTAssertEqual(filtredCards.count, 4)
        
        let expectation = self.expectation(description: "download should complete")
        validator.getCardInfo(forNumber: "4929804463622139") { info in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 15, handler: nil)
    }

}
