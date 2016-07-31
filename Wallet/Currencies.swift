//
//  Currencies.swift
//  Wallet
//
//  Created by fran on 21/7/16.
//  Copyright © 2016 Francisco Navarro Aguilar. All rights reserved.
//

import Foundation

enum Currencies{
    case EUR
    case USD
    case GBP
    
    func description() -> String{
        switch self {
        case .EUR:
            return "EUR"
        case .USD:
            return "USD"
        case .GBP:
            return "GBP"
        }
        
    }
}

