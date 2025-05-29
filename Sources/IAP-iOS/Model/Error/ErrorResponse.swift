//
//  ErrorResponse.swift
//  Model
//
//  Created by Nickelfox on 01/11/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit
import JSONParsing

private let errorKey = "error"

public struct ErrorResponse: ErrorResponseProtocol {
    public var message: String {
        return self.messages.joined(separator: ", ")
    }
    
    public var domain: String {
        return ""
    }
    // change structure according to API
    public static func parse(_ json: JSON, code: Int) throws -> ErrorResponse {
        return try ErrorResponse(
            code: json["error"]["error_code"]^,
            messages: json["error"]["error_message"]^^
        )
    }
    
    public var code: Int
    public var messages: [String]
    
    public var title: String {
        return "Error"
    }
    
}
