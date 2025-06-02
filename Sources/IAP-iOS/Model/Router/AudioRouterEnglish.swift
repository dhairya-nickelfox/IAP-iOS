//
//  AudioRouterEnglish.swift
//  Model
//
//  Created by Akanksha Trivedi on 12/05/23.
//  Copyright © 2023 IFSTA. All rights reserved.
//

//import Foundation
//import FoxAPIKit
//
//public enum AudioRouterEnglish: BaseRouter {
//    
//    case download(urlId: String)
//    
//    public var method: HTTPMethod {
//        return .get
//    }
//    
//    public var params: [String: Any] {
//        return [:]
//    }
//    
//    // use API url
//    public var baseUrl: URL {
//        print("URL For Download URL is \(URL(string: APIConfig.downloadURLForMaleAudio)!)")
//        return URL(string: APIConfig.downloadURLForMaleAudio)!
//    }
//
//    public var path: String {
//        switch self {
//        case .download(let urlId):
//            return urlId
//        }
//    }
//    
//    public var headers: [String: String] {
//        return APIConfig.audioHeaders
//    }
//    
//    
//}
