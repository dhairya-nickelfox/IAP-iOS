//
//  VideosManager.swift
//  Model
//
//  Created by Sagar Nagpal on 27/04/22.
//  Copyright © 2022 AppCenter. All rights reserved.
//

//
//import Foundation
//import RealmSwift
//import Realm
////import Model
//
//struct VideosManager {
//    
//    static var realm: Realm {
//        do {
//            return try Realm()
//        } catch let error {
//            fatalError("Error initializing Realm: \(error)")
//        }
//    }
//    typealias CompletionH = (Bool, Error?) -> Void
//    
//    // get all videos chapter
//    static func getAllChapters() -> [Video] {
//        let videos = realm.objects(Video.self)
//        return Array(videos)
//    }
//    
//    // get videos chapters for the similar id in playerViewController
//    static func getChaptersOfId(chapterID: String) -> [Video] {
//        let predicate = NSPredicate(format: "identifer BEGINSWITH %@", (chapterID))
//        let chapters = realm.objects(Video.self).filter(predicate)
//        return Array(chapters)
//    }
//    
//    
//    static func removeDownloadedVideo(_ completion: CompletionH, chapterNumber: String) {
//        guard let selectedVideo = realm.objects(Video.self).filter("chapterNumber == %@", chapterNumber).first else { return }
//        
//        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        let pathComponent = chapterNumber + Constant.Video.fileExtension
//        let path = "/\(documentsURL.path)/\(pathComponent)"
//        if !path.isEmpty {
//            do {
//                try FileManager.default.removeItem(atPath: path)
//                    try realm.write {
//                        selectedVideo.isDownloaded = DownloadState.notDownloaded.rawValue
//                    }
//                    completion(true, nil)
//            } catch {
//                completion(false, error)
//            }
//        }
//    }
//    
//    
//    static func removeAllDownloadedVideos(_ completion: CompletionH) {
//        let videos = realm.objects(Video.self)
//        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        for video in videos where video.isDownloaded != 0 {
//            let pathComponent = video.chapterNumber + Constant.Video.fileExtension
//            let path = "/\(documentsURL.path)/\(pathComponent)"
//            if !path.isEmpty {
//                do {
//                    try FileManager.default.removeItem(atPath: path)
//                    try realm.write {
//                        video.isDownloaded = DownloadState.notDownloaded.rawValue
//                    }
//                    completion(true, nil)
//                } catch {
//                    completion(false, error)
//                }
//            }
//        }
//    }
//}
//
//public class AudioNotes: Object {
//    @objc dynamic public var title: String = ""
//    @objc dynamic public var duration: Double = 0.0
//}
//
//
//
//public class AudioBookMarks: Object {
//    @objc dynamic public var bookmarkName: String = ""
//    @objc dynamic public var duration: Double = 0.0
////    @objc dynamic public var chapterId: Int = 0 // { get }
//}
