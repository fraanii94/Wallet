//
//  Broker.swift
//  Wallet
//
//  Created by fran on 22/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import Foundation


class Broker {
    
    var rates : [String : Double]
    
    init(){
        rates = Dictionary()
        
    }
    
    func add(rate r: Double, fromCurrency f: Currencies, toCurrency t: Currencies){
        
        rates[self.key(fromCurrency: f, toCurrency: t)] = r
        rates[self.key(fromCurrency: t, toCurrency: f)] = 1/r
        
    }
    
    func key(fromCurrency f: Currencies,toCurrency t: Currencies) -> String{
        return "\(f.description())-\(t.description())"
    }
    
    func reduce(money m: _Money,toCurrency t: Currencies) throws ->  Money{
        
        return try m.reduceTo(currency: t, broker: self)
    }
    
}