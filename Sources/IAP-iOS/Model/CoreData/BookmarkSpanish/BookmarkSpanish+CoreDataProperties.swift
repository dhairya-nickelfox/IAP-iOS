//
//  BookmarkSpanish+CoreDataProperties.swift
//  Model
//
//  Created by Akanksha Trivedi on 26/05/23.
//  Copyright © 2023 IFSTA. All rights reserved.
//
//

import Foundation
import CoreData


extension BookmarkSpanish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookmarkSpanish> {
        return NSFetchRequest<BookmarkSpanish>(entityName: "BookmarkSpanish")
    }

    @NSManaged public var duration: Double
    @NSManaged public var title: String

}

extension BookmarkSpanish : Identifiable {

}
