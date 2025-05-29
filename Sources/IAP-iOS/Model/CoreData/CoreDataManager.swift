//
//  CoreDataManager.swift
//  Model
//
//  Created by Abhishek Thapliyal on 11/07/21.
//  Copyright © 2021 Nickelfox. All rights reserved.
//

//import Foundation
//import CoreData
//
//@available(iOS 10.0, *)
//public var context: NSManagedObjectContext {
//	return CoreDataManager.shared.persistentContainer.viewContext
//}
//
//@available(iOS 10.0, *)
//public final class CoreDataManager {
//	
//	public static let shared = CoreDataManager()
//	private init() {}
//	
//	// MARK: - Core Data stack
//
//	fileprivate lazy var persistentContainer: NSPersistentContainer = {
//		let container = NSPersistentContainer(name: "Essentials8")
//		container.loadPersistentStores(completionHandler: { (_, error) in
//			if let error = error as NSError? {
//				fatalError("Unresolved error \(error), \(error.userInfo)")
//			}
//		})
//		return container
//	}()
//
//	// MARK: - Core Data Saving support
//
//	public func saveContext () {
//		if context.hasChanges {
//			do {
//				try context.save()
//			} catch {
//				let nserror = error as NSError
//				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//			}
//		}
//	}
//	
//}
