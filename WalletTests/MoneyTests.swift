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
        let five = Money.euroWithAmount(amount: 5) 
        let ten = Money.euroWithAmount(amount: 10) 
        let total = five.times(2) as! Money
        
        let totalDollars = (Money.dollarWithAmount(amount: 5)).times(2) as! Money
        let tenDollars = Money.dollarWithAmount(amount: 10)
        XCTAssertEqual(ten, total, "5€ * 2 should be 10€")
        XCTAssertEqual(totalDollars, tenDollars, "5$ * 2 should be 10$")
        
    }
    
    func testSum(){
        let five = Money.euroWithAmount(amount: 5) 
        let ten = Money.euroWithAmount(amount: 10)
        let total = five.plus(five) as! Money
        
        let two = Money.dollarWithAmount(amount: 2) 
        let four = Money.dollarWithAmount(amount: 4)
        let totalDollars = two.plus(two) as! Money
        
        XCTAssertEqual(ten, total, "5€ + 5€ should be 10€")
        XCTAssertEqual(four, totalDollars, "2$ + 2$ should be 4$")
    }
    
    func testCurrencyAfterMultiplication(){
        
        let euro = Money.euroWithAmount(amount: 1).times(2) as! Money
        let dollar = Money.dollarWithAmount(amount: 1).times(2) as! Money
        
        XCTAssertEqual(Currencies.EUR, euro.currency, "Currency should be the same after multiplication")
        XCTAssertEqual(Currencies.USD, dollar.currency, "Currency should be the same after multiplication")
    }
    
    func testCurrencyAfterSum(){
        
        var euro = Money.euroWithAmount(amount: 1)
        euro = euro.plus(euro) as! Money
        
        var dollar = Money.dollarWithAmount(amount: 2)
        dollar = dollar.plus(dollar) as! Money
        
        XCTAssertEqual(Currencies.EUR, euro.currency, "Currency should be the same after sum")
        XCTAssertEqual(Currencies.USD, dollar.currency, "Currency should be the same after sum")
    }
    
    func testCurrencyStorage(){
        let four = Money.euroWithAmount(amount: 4) 
        let two = Money.dollarWithAmount(amount: 2) 
        
        XCTAssertEqual(4, four.amount , "Money storaged should be same than created")
        XCTAssertEqual(2, two.amount , "Money storaged should be same than created")
    }

    
    func testCurrencies(){
        let euro    = Money.euroWithAmount(amount: 1) 
        let dollar  = Money.dollarWithAmount(amount: 1) 
        
        XCTAssertEqual(euro.currency, Currencies.EUR, "The currency of an euro should be EUR")
        XCTAssertEqual(dollar.currency, Currencies.USD, "The currency of a dollar should be USD")
    }
    
    func testEquality(){
        // For euro
        let five    = Money.euroWithAmount(amount: 5) 
        XCTAssertEqual(five, Money.euroWithAmount(amount: 5), "Same objects should be equal")
        XCTAssertNotEqual(five, Money.euroWithAmount(amount: 3), "Different objects should be different")
        
        // For Dollars
        let ten    = Money.dollarWithAmount(amount: 10) 
        XCTAssertEqual(ten, Money.dollarWithAmount(amount: 10), "Same objects should be equal")
        XCTAssertNotEqual(ten, Money.dollarWithAmount(amount: 3), "Different objects should be different")
    }
    
    func testHash(){
        
        let euro = Money.euroWithAmount(amount: 1)
        
        XCTAssertEqual(Int(euro.amount), euro.hashValue,"The hash should be the amount")
        
    }
    
    func testDescription(){
        
        let euro = Money.euroWithAmount(amount: 1)
        
        XCTAssertEqual(euro.description, "<Money EUR1.0>", "Money description should satisfy the format")
        
    }
    
    
    func testDifferentCurrencies(){
        
        XCTAssertNotEqual(Money.euroWithAmount(amount: 5),Money.dollarWithAmount(amount: 5), "Different currencies should be different")
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
