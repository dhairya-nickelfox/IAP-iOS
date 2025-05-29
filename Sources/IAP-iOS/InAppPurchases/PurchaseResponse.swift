//
//  PurchaseResponse.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation

class PurchaseResponse {
    var purchasedModules: [String]?
    var success: Bool
    
    init(restoredModules: [String]?, success: Bool) {
        self.purchasedModules = restoredModules
        self.success = success
    }
}
