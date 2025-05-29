//
//  AudiobookSpanish+CoreDataProperties.swift
//  Model
//
//  Created by Akanksha Trivedi on 26/05/23.
//  Copyright © 2023 IFSTA. All rights reserved.
//
//

import Foundation
import CoreData


extension AudiobookSpanish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AudiobookSpanish> {
        return NSFetchRequest<AudiobookSpanish>(entityName: "AudiobookSpanish")
    }

    @NSManaged public var audioDownloadState: Int16
    @NSManaged public var audioPurchaseState: Int16
    @NSManaged public var index: Int16
    @NSManaged public var isBookmarked: Bool
    @NSManaged public var name: String
    @NSManaged public var savedTrackTime: Double
    @NSManaged public var trackTime: String
    @NSManaged public var urlId: String
    @NSManaged public var isLastPlayed: Bool
    @NSManaged public var lastPlayedTime: Double
    @NSManaged public var lastProgressTime: Double
    @NSManaged public var bookmarksSpanish: NSSet
}

// MARK: Generated accessors for bookmarksSpanish
extension AudiobookSpanish {

    @objc(addBookmarksSpanishObject:)
    @NSManaged public func addToBookmarksSpanish(_ value: BookmarkSpanish)

    @objc(removeBookmarksSpanishObject:)
    @NSManaged public func removeFromBookmarksSpanish(_ value: BookmarkSpanish)

    @objc(addBookmarksSpanish:)
    @NSManaged public func addToBookmarksSpanish(_ values: NSSet)

    @objc(removeBookmarksSpanish:)
    @NSManaged public func removeFromBookmarksSpanish(_ values: NSSet)

}

extension AudiobookSpanish : Identifiable {

}
