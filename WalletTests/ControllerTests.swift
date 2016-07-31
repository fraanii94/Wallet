//
//  ControllerTests.swift
//  Wallet
//
//  Created by fran on 24/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import XCTest

class ControllerTests: XCTestCase {
    
    
    var wallet = Wallet(amount: 1, currency: .USD)
    var walletVC = WalletTableViewController()
    
    
    
    override func setUp() {
        super.setUp()
        let broker = Broker()
        broker.add(rate: 2, fromCurrency: .EUR, toCurrency: .USD)
        walletVC = WalletTableViewController(model: wallet,broker: broker)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTitle(){
        XCTAssertEqual("Wallet", walletVC.title,"The title should be 'Wallet'")
    }
    
    func testNumberOfSectionsIsCurrenciesPlusOne(){
        
        let sections = self.walletVC.numberOfSectionsInTableView(self.walletVC.tableView)
        
        XCTAssertEqual(sections, self.wallet.currencies.count + 1 ,"There should be a section for each currency plus one for total")
        
    }
    
    func testNumberOfRowsIsMoneysPlusOne(){
        
        XCTAssertEqual(self.wallet.count + 1, self.walletVC.tableView(self.walletVC.tableView, numberOfRowsInSection: 0),"There should be one row in a section for each money plus one for subtotal")
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
