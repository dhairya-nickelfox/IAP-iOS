//
//  Video.swift
//  IFSTA Companion App
//
//  Created by AppCenter on 3/7/17.
//  Copyright © 2017 AppCenter. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

public class Video: Object {
    
    @objc dynamic public var identifer = ""
    @objc dynamic public var chapterTitle = ""
    @objc dynamic public var videoId = ""
    @objc dynamic public var category = ""
    @objc dynamic public var videoDuration = ""
    @objc dynamic public var isBookmarked = false
    @objc dynamic public var chapterNumber = ""
    @objc dynamic public var steps: String = ""
    @objc dynamic public var notes: String = ""
    @objc dynamic public var webLink = ""
    @objc dynamic public var downloadLink = ""
    @objc dynamic public var isDownloaded: Int = 0
    @objc dynamic public var parentVideo = false
    @objc dynamic public var downloadPath = ""
    @objc dynamic public var thumbnailImage = ""
    @objc dynamic public var lastProgressTime: TimeInterval = 0
    
    public let subVideos = List<Video>()
    
    @objc let separator = "  "
    
    @objc dynamic public var notesList: [String] {
        // get { return notes.components(separatedBy: separator) ?? [] }
        get { return notes.components(separatedBy: separator) }
        set { notes = newValue.isEmpty ? "" : newValue.joined(separator: separator)}
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["stepsList", "notesList"]
    }
    
    public override static func primaryKey() -> String? {
        return "identifer"
    }
    
    public var downloadTask: URLSessionDownloadTask?
    public var observation: NSKeyValueObservation?
    
}
