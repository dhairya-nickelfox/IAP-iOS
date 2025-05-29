//
//  BaseRouter.swift
//  Model
//
//  Created by Nickelfox on 01/11/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit

public protocol BaseRouter: Router {
    
}
public let defaultPerPage = 20

extension BaseRouter {
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return ""
    }
    
    public var params: [String: Any] {
        return [:]
    }
    
    // use API url
    public var baseUrl: URL {
        return URL(string: "")!
    }
    
    public var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    public var encoding: URLEncoding? {
        return nil
    }
    
    public var timeoutInterval: TimeInterval? {
        return nil
    }
    
    public var keypathToMap: String? {
        return nil
    }
    
}
