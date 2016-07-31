//
//  Wallet.swift
//  Wallet
//
//  Created by fran on 24/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import Foundation


class Wallet : _Money{
    
    var moneys : [Currencies : [Money]] = [Currencies : [Money]]()
    var count : NSInteger {
        get{
            return moneys.count
        }
    }
    var currencies : [Currencies]{
        get{
            var aux = [Currencies]()
            for key in self.moneys.keys{
                aux.append(key)
            }
            return aux
        }
    }
    required init(amount am: Double, currency c: Currencies) {
        let money = Money(amount: am, currency: c)
        if(moneys[c] == nil){
            moneys[c] = [Money]()
        }
        moneys[c]?.append(money)
        
    }
    
    
    func currencyAt(index i: NSInteger) -> Currencies{
        
        return currencies[i]
        
    }
    
    func numberOfMoneysAt(index i : NSInteger) -> Int{
        return (self.moneys[self.currencyAt(index: i)]?.count)!
    }
    
    func times(multiplier: Double) -> _Money {
        var newMoneys = [Currencies : [Money]]()
        
        for currency in self.moneys.keys {
            for money in self.moneys[currency]!{
                let multipliedMoney = money.times(multiplier) as! Money
                if(newMoneys[currency] == nil){
                    newMoneys[currency] = [Money]()
                
                }
                newMoneys[currency]?.append(multipliedMoney)
            }
    
        }
        
        moneys = newMoneys
        
        return self
        
    }
    func plus(money: Money) -> _Money {
        
        if(moneys[money.currency] == nil){
            moneys[money.currency] = [Money]()
        }
        moneys[money.currency]?.append(money)
        
        return self
        
    }
    
    
    
    func reduceTo(currency c: Currencies, broker b: Broker) throws -> Money {
        var result  = Money(amount: 0, currency: c)
        for currency in self.moneys.keys{
            for money in self.moneys[currency]! {
                let reduced =  try money.reduceTo(currency: c, broker: b)
                result = result.plus(reduced) as! Money
            }
        }
        return result
    }
    
}