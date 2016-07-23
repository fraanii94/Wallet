//
//  WalletTests.swift
//  Wallet
//
//  Created by fran on 24/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import XCTest

class WalletTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAdditionWithReduction(){
        let broker = Broker()
        broker.add(rate: 2, fromCurrency: .EUR, toCurrency: .USD)
        
        let wallet = Wallet(amount:1, currency: .EUR)
        wallet.plus(Money.dollarWithAmount(amount: 2))
        
        do{
            let reduced = try broker.reduce(money: wallet, toCurrency: .USD)
            let money = Money(amount: 4, currency: .USD)
            XCTAssertEqual(reduced, money,"Reduced wallet")
            
        }catch{
            
        }
        
        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
