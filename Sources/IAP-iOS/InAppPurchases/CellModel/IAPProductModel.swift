//
//  IAPProductModel.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import StoreKit

class IAPProductModel {
    
    var products = [SKProduct]()
        
    func getProduct(containing keyword: String) -> SKProduct? {
        return products.filter { $0.productIdentifier.contains(keyword) }.first
    }
}
