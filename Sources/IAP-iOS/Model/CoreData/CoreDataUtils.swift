//
//  CoreDataUtils.swift
//  Model
//
//  Created by Vaibhav Parmar on 14/03/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

// swiftlint: disable force_cast

//import Foundation
//import CoreData
//import JSONParsing
//import FLUtilities
//
//public struct PrimaryKey {
//    public var keypath: String
//    public var jsonKeypath: String
//}
//
//public protocol JSONCoreDataParsable: JSONParseable, NSFetchRequestResult {
//    static var primaryKeyValues: [PrimaryKey] { get }
//    func update(json: JSON) throws
//    static func useableJSON(json: JSON) -> JSON
//}
//
//extension JSONCoreDataParsable where Self: NSManagedObject {
//    
//	public static func useableJSON(json: JSON) -> JSON {
//        return json
//    }
//
//	@discardableResult
//    public static func parse(_ jsonFromServer: JSON) throws -> Self {
//        let json = Self.useableJSON(json: jsonFromServer)
//        func update(object: Self) throws -> Self {
//            do {
//                try object.update(json: json)
//                try context.save()
//                return object
//            } catch {
//                print("PARSE DB ERROR 2: \(error)")
//                throw error
//            }
//        }
//        
//        do {
//            let req = NSFetchRequest<Self>(entityName: Self.className())
//            let predicate = NSPredicate(format: Self.predicateFormat(json: json))
//            req.predicate = predicate
//            if let object = try context.fetch(req).first {
//                return try update(object: object)
//            } else {
//                let entity = NSEntityDescription.entity(forEntityName: Self.className(), in: context)!
//                let object = Self(entity: entity, insertInto: context)
//                return try update(object: object)
//            }
//        } catch {
//            print("PARSE DB ERROR 1: \(error)")
//            throw error
//        }
//    }
//
//    static func predicateFormat(json: JSON) -> String {
//        var predicate: String = ""
//        var count = 0
//        for primaryKey in self.primaryKeyValues {
//            if count < self.primaryKeyValues.count - 1 {
//                predicate += "\(primaryKey.keypath) = \"\(json[primaryKey.jsonKeypath].stringValue)\" AND "
//            } else {
//                predicate += "\(primaryKey.keypath) = \"\(json[primaryKey.jsonKeypath].stringValue)\""
//            }
//            count += 1
//        }
//        return predicate
//    }
//
//    public static var allObjects: [Self] {
//        var objects: [Self] = []
//        do {
//            objects = try context.fetch(Self.fetchRequest()) as! [Self]
//        } catch {
//            print(error)
//        }
//        return objects
//    }
//}
