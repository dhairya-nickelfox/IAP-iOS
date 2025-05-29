//
//  Audiobook+CoreDataProperties.swift
//  Model
//
//  Created by Akanksha Trivedi on 26/05/23.
//  Copyright © 2023 IFSTA. All rights reserved.
//
//

import Foundation
import CoreData


extension Audiobook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Audiobook> {
        return NSFetchRequest<Audiobook>(entityName: "Audiobook")
    }

    @NSManaged public var audioDownloadState: Int16
    @NSManaged public var audioPurchaseState: Int16
    @NSManaged public var index: Int16
    @NSManaged public var isBookmarked: Bool
    @NSManaged public var name: String
    @NSManaged public var savedTrackTime: Double
    @NSManaged public var spanishName: String
    @NSManaged public var trackTime: String
    @NSManaged public var urlId: String
    @NSManaged public var isLastPlayed: Bool
    @NSManaged public var lastPlayedTime: Double
    @NSManaged public var lastProgressTime: Double
    @NSManaged public var bookmarks: NSSet

}

// MARK: Generated accessors for bookmarks
extension Audiobook {

    @objc(addBookmarksObject:)
    @NSManaged public func addToBookmarks(_ value: Bookmark)

    @objc(removeBookmarksObject:)
    @NSManaged public func removeFromBookmarks(_ value: Bookmark)

    @objc(addBookmarks:)
    @NSManaged public func addToBookmarks(_ values: NSSet)

    @objc(removeBookmarks:)
    @NSManaged public func removeFromBookmarks(_ values: NSSet)

}

extension Audiobook : Identifiable {

}
