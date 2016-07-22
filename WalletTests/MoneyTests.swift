//
//  MoneyTests.swift
//  Wallet
//
//  Created by fran on 21/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import XCTest
@testable import Wallet

class MoneyTests: XCTestCase {
    
    func testMultiplication(){
        let five = Money.euroWithAmount(amount: 5) as! Money
        let ten = Money.euroWithAmount(amount: 10) as! Money
        let total = five.times(2)
        
        XCTAssertEqual(ten, total, "5€ * 2 should be 10€")
        XCTAssertEqual((Money.dollarWithAmount(amount: 5) as! Money).times(2), (Money.dollarWithAmount(amount: 10) as! Money), "5$ * 2 should be 10$")
        
    }
    
    func testSum(){
        let five = Money.euroWithAmount(amount: 5) as! Money
        let ten = Money.euroWithAmount(amount: 10) as! Money
        let two = Money.dollarWithAmount(amount: 2) as! Money
        let four = Money.dollarWithAmount(amount: 4) as! Money
        
        XCTAssertEqual(ten, five.plus(5), "5€ + 5€ should be 10€")
        XCTAssertEqual(four, two.plus(2), "2$ + 2$ should be 4$")
    }
    
    func testCurrencyAfterMultiplication(){
        
        let euro = (Money.euroWithAmount(amount: 1) as! Money).times(2)
        let dollar = (Money.dollarWithAmount(amount: 1) as! Money).times(2)
        
        XCTAssertEqual(Currencies.EUR, euro.currency, "Currency should be the same after multiplication")
        XCTAssertEqual(Currencies.USD, dollar.currency, "Currency should be the same after multiplication")
    }
    
    func testCurrencyAfterSum(){
        
        let euro = (Money.euroWithAmount(amount: 2) as! Money).plus(2)
        let dollar = (Money.dollarWithAmount(amount: 2) as! Money).plus(2)
        
        XCTAssertEqual(Currencies.EUR, euro.currency, "Currency should be the same after sum")
        XCTAssertEqual(Currencies.USD, dollar.currency, "Currency should be the same after sum")
    }
    
    func testCurrencyStorage(){
        let four = Money.euroWithAmount(amount: 4) as! Money
        let two = Money.dollarWithAmount(amount: 2) as! Money
        
        XCTAssertEqual(4, four.amount , "Money storaged should be same than created")
        XCTAssertEqual(2, two.amount , "Money storaged should be same than created")
    }

    
    func testCurrencies(){
        let euro    = Money.euroWithAmount(amount: 1) as! Money
        let dollar  = Money.dollarWithAmount(amount: 1) as! Money
        
        XCTAssertEqual(euro.currency, Currencies.EUR, "The currency of an euro should be EUR")
        XCTAssertEqual(dollar.currency, Currencies.USD, "The currency of a dollar should be USD")
    }
    
    func testEquality(){
        // For euro
        let five    = Money.euroWithAmount(amount: 5) as! Money
        XCTAssertEqual(five, (Money.euroWithAmount(amount: 5) as! Money), "Same objects should be equal")
        XCTAssertNotEqual(five, (Money.euroWithAmount(amount: 3) as! Money), "Different objects should be different")
        
        // For Dollars
        let ten    = Money.dollarWithAmount(amount: 10) as! Money
        XCTAssertEqual(ten, (Money.dollarWithAmount(amount: 10) as! Money), "Same objects should be equal")
        XCTAssertNotEqual(ten, (Money.dollarWithAmount(amount: 3) as! Money), "Different objects should be different")
    }
    
    func testDifferentCurrencies(){
        
        XCTAssertNotEqual((Money.euroWithAmount(amount: 5) as! Money),(Money.dollarWithAmount(amount: 5) as! Money), "Different currencies should be different")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
