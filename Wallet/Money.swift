//
//  Money.swift
//  Wallet
//
//  Created by fran on 21/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import Foundation

class Money : Equatable, Hashable, _Money{

    private(set) var amount     : Double = 0
    private(set) var currency : Currencies
    var hashValue: Int {
        get{
            return  Int(amount)
        }
    }
    
    
    
    static func euroWithAmount(amount am: Double) -> Money {
        return Money(amount: am, currency: .EUR)
    }
    
    static func dollarWithAmount(amount am: Double) -> Money {
        return Money(amount: am, currency: .USD)
    }
    
    
    required init(amount am:Double, currency c:Currencies){
        amount = am
        currency = c
    }
    
    func times(multiplier : Double) -> _Money{
        
        return Money(amount: self.amount * multiplier,currency: self.currency)
        
    }
    
    func plus(money: Money) -> _Money{
        
        return Money(amount: self.amount + money.amount, currency: self.currency)
    }
    
    func reduceTo(currency c: Currencies, broker b: Broker) throws -> Money {
        
        if(self.currency == c){
            return self
        }
        
        guard let rate = b.rates[b.key(fromCurrency: self.currency, toCurrency: c)] else{
            
            throw NSError(domain: "No rates for that currencies", code: -1, userInfo: nil)
            
        }
        
        
        let newAmount = self.amount * rate
        
        let newMoney = Money.init(amount: newAmount, currency: c)
        
        return newMoney
    }

    
    
    
    var proxyForComparison : String{
        
        get{
            return "\(amount)\(currency)"
        }
    }
    
    
}

func ==(lhs: Money, rhs: Money) -> Bool{
    
    return lhs.proxyForComparison == rhs.proxyForComparison
    
    
}

extension Money :CustomStringConvertible{
    
    var description: String {
        get{
            
            return "<Money \(currency)\(amount)>"
            
        }
    }
    
}

protocol _Money{
    
    init(amount am:Double, currency c:Currencies)
    func times(multiplier : Double) -> _Money
    func plus(money: Money) -> _Money
    func reduceTo(currency c: Currencies,broker b: Broker) throws -> Money

}



