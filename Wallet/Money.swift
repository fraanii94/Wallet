//
//  Money.swift
//  Wallet
//
//  Created by fran on 21/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import Foundation

class Money : Equatable{

    private(set) var amount     : NSInteger = 0
    private(set) var currency : Currencies
    
    init(amount am:NSInteger, currency c:Currencies){
        amount = am
        currency = c
    }
    
    
    func times(multiplier : NSInteger) -> Money{
        
        return Money(amount: self.amount * multiplier,currency: self.currency)
        
    }
    
    func plus(sum: NSInteger) ->Money{
        
        return Money(amount: self.amount + sum, currency: self.currency)
    }
    
    
    var proxyForComparison : String{
        
        get{
            return "\(amount)\(currency)"
        }
    }
    
    //MARK: Protocols methos
    
    static func euroWithAmount(amount am: NSInteger) -> AnyObject {
        return Money(amount: am, currency: .EUR) 
    }

    static func dollarWithAmount(amount am: NSInteger) -> AnyObject {
        return Money(amount: am, currency: .USD)
    }
    
    
}

func ==(lhs: Money, rhs: Money) -> Bool{
    
    return lhs.proxyForComparison == rhs.proxyForComparison
    
    
}

