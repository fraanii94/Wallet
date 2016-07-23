//
//  Wallet.swift
//  Wallet
//
//  Created by fran on 24/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import Foundation


class Wallet : _Money{
    
    var moneys : [Money] = [Money]()
    
    required init(amount am: Double, currency c: Currencies) {
        let money = Money(amount: am, currency: c)
        moneys.append(money)
    }
    
    func times(multiplier: Double) -> _Money {
        var newMoneys = [Money]()
        
        for money in self.moneys {
            let multipliedMoney = money.times(multiplier) as! Money
            newMoneys.append(multipliedMoney)
        }
        
        return self
        
    }
    func plus(money: Money) -> _Money {
        
        moneys.append(money)
        
        return self
        
        
    }
    
    func reduceTo(currency c: Currencies, broker b: Broker) throws -> Money {
        var result  = Money(amount: 0, currency: c)
        for money in self.moneys {
            let reduced =  try money.reduceTo(currency: c, broker: b)
            result = result.plus(reduced) as! Money
        }
        return result
    }
    
}