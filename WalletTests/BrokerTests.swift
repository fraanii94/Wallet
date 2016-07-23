//
//  BrokerTests.swift
//  Wallet
//
//  Created by fran on 22/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import XCTest

class BrokerTests: XCTestCase {
    
    var emptyBroker : Broker = Broker()
    var euro    : Money = Money.euroWithAmount(amount: 1)
    var dollars : Money = Money.dollarWithAmount(amount: 2)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSimpleReduction() {
        
        emptyBroker.add(rate: 2, fromCurrency: .EUR, toCurrency: .USD)
        
        do{
            let reduction = try emptyBroker.reduce(money: euro, toCurrency: .EUR) 
            
            XCTAssertEqual(euro, reduction,"Reduction to same currency should be equals")
        }catch{
            
        }
        
    }
    
    func testReduction(){
        
    
        emptyBroker.add(rate: 2, fromCurrency: .EUR, toCurrency: .USD)
        do{
            let reduction = try emptyBroker.reduce(money: euro, toCurrency: .USD) 
            XCTAssertEqual(dollars, reduction,"1€ == 2$ 2:1")
        }catch{
            
        }
        
        
        
        
    }
    
    func testReductionThrowException(){
        
        
        XCTAssertThrowsError(try emptyBroker.reduce(money: euro, toCurrency: .USD),"No rates causes exception")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
