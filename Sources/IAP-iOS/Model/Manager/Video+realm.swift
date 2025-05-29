//
//  Video+realm.swift
//  Model
//
//  Created by Sagar Nagpal on 27/04/22.
//  Copyright © 2022 AppCenter. All rights reserved.
//

//import Foundation
//import Realm
//import RealmSwift
////import Model
//
//extension Video {
    
    //    public static func setupVideoData() {
    //
    //        guard !DataModel.shared.isVideosLoaded,
    //              let url = Bundle.main.url(forResource: "Videos", withExtension: "json"),
    //              let data = try? Data(contentsOf: url) else { return }
    //        do {
    //            let realm = try Realm()
    //
    //            try realm.write {
    //                // Delete all Video objects from Realm
    //                let allVideos = realm.objects(Video.self)
    //                realm.delete(allVideos)
    //            }
    //            let json = try JSONSerialization.jsonObject(with: data, options: [])
    //
    //            if let videos = json as? [[String: Any]] {
    //                for video in videos {
    //                    try realm.write {
    //                        realm.create(Video.self, value: video, update: .all)
    //
    //                    }
    //                }
    //            }
    //            DataModel.shared.isVideosLoaded = true
    //        } catch {
    //            print(error.localizedDescription)
    //        }
    //    }
    
//    @MainActor public static func setupVideoData() {
//        guard !DataModel.shared.isVideosLoaded,
//              let url = Bundle.main.url(forResource: "Videos", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else { return }
//        
//        do {
//            let realm = try Realm()
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            
//            if let videos = json as? [[String: Any]] {
//                try realm.write {
//                    for videoData in videos {
//                        if let identifier = videoData["identifer"] as? String {
//                            if let existingVideo = realm.object(ofType: Video.self, forPrimaryKey: identifier) {
//                                // Preserve important fields
//                                let isBookmarked = existingVideo.isBookmarked
//                                let isDownloaded = existingVideo.isDownloaded
//                                let lastProgressTime = existingVideo.lastProgressTime
//                                let downloadPath = existingVideo.downloadPath
//                                
//                                // Update the existing object with new values
//                                realm.create(Video.self, value: videoData, update: .modified)
//                                
//                                // Restore preserved values
//                                existingVideo.isBookmarked = isBookmarked
//                                existingVideo.isDownloaded = isDownloaded
//                                existingVideo.lastProgressTime = lastProgressTime
//                                existingVideo.downloadPath = downloadPath
//                            } else {
//                                // Create a new video entry
//                                realm.create(Video.self, value: videoData, update: .all)
//                            }
//                        }
//                    }
//                }
//            }
//            DataModel.shared.isVideosLoaded = true
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//    public func updateBookmark() {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                self.isBookmarked = !self.isBookmarked
//            }
//        } catch {
//            print(error)
//        }
//    }
//    
//    public func updateDownload(value: Int) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                self.isDownloaded = value
//            }
//        } catch {
//            print(error)
//        }
//    }
//    
//    public func updateProgressTime(lastProgressTime: Double) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                self.lastProgressTime = lastProgressTime
//            }
//        } catch {
//            print(error)
//        }
//    }
//}
