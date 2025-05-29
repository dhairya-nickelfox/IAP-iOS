//
//  HazmatReachablity.swift
//  Model
//
//  Created by Nickelfox on 01/11/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

//import Foundation
//import Alamofire
//
//public final class HazmatReachablity {
//    public static let shared = HazmatReachablity()
//    private let manager = NetworkReachabilityManager.init()
//
//    public static var isNetworkAvailable: Bool {
//        return NetworkReachabilityManager()?.isReachable ?? false
//    }
//    
//    public func startListening() {
//        self.manager?.listener = { status in
//            if status == .notReachable {
//                NotificationCenter.default.post(name: .isNotConnectedToNetwork, object: nil)
//                print("not reachable")
//            } else {
//                // reachable
//                NotificationCenter.default.post(name: .isConnectToNetwork, object: nil)
//                print("Reachable")
//            }
//        }
//        self.manager?.startListening()
//    }
//    
//    public func stopListening() {
//        self.manager?.stopListening()
//    }
//}
