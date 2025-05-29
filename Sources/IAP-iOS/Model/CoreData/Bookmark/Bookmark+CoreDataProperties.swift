//
//  Bookmark+CoreDataProperties.swift
//  Model
//
//  Created by Akanksha Trivedi on 26/05/23.
//  Copyright © 2023 IFSTA. All rights reserved.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var duration: Double
    @NSManaged public var title: String

}

extension Bookmark : Identifiable {

}
