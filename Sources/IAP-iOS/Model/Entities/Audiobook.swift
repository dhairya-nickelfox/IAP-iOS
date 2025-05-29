//
//  Audiobook.swift
//  Model
//
//  Created by Abhishek Thapliyal on 11/07/21.
//  Copyright © 2021 Nickelfox. All rights reserved.
//

// swiftlint:disable force_cast mark

//import Foundation
//import JSONParsing
//
//extension Audiobook {
//    
//    public static func setupData() {
//        guard !DataModel.shared.isAudioBookSetuped,
//              let url = Bundle.main.url(forResource: "audiobook", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else { return }
//        do {
//            let json = try JSON(data: data)
//            try json.arrayValue.forEach {
//                try Audiobook.parse($0)
//            }
//            DataModel.shared.isAudioBookSetuped = true
//        } catch {
//            print("Error in AudioBooks \(error.localizedDescription)")
//            print(error)
//        }
//    }
//    
//    public func updateBookmark() {
//        do {
//            self.isBookmarked.toggle()
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    public func updateDownload(value: Int16) {
//        do {
//            print("Downloaded Videos is \(value)")
//            self.audioDownloadState = value
//            try context.save()
//            print("saved Videos is \(value)")
//        } catch {
//            print("Errror in downloaded video is \(error.localizedDescription)")
//            print(error)
//        }
//    }
//    
//    public static func updatePurchase() {
//        do {
//            self.allObjects.filter {
//                $0.index != 1
//            }.forEach {
//                $0.audioPurchaseState = 2
//            }
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    /// Method performs deletion of downloaded file from documents directory and then changes state of each AudioBook to 'Not Downloaded'
//    /// - Parameters:
//    ///   - items: list of AudioBooks that are to be deleted
//    ///   - completion: takes in a bool for success and optional Error object
//    public static func deleteItems(items: [Audiobook?], _ completion: (Bool, Error?) -> Void) {
//            guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        var isFirefighterIValue: Bool = false
//            for audioBook in items {
//                if audioBook?.bookName == "Firefighter I" {
//                    isFirefighterIValue = true
//                }
//                if audioBook?.bookName == "Firefighter II" {
//                    isFirefighterIValue = false
//                }
//                let adjustIndex = Int(audioBook?.index ?? 0) - 16
//                guard let url = audioBook?.urlId else  { return }
//                
//                let pathComponent = isFirefighterIValue ? "ff1_ch\(url)_m.mp3" : "ff2_ch0\(adjustIndex)_m.mp3"
//                let path = "/\(documentsURL.path)/\(pathComponent)"
//                print("Path of delete item is \(path)")
//                if !path.isEmpty {
//                    do {
//                        try FileManager.default.removeItem(atPath: path)
//                        
//                        do {
//                            audioBook?.audioDownloadState = Int16(DownloadState.notDownloaded.rawValue)
//                            try context.save()
//                        } catch {
//                            completion(false, error)
//                        }
//                    } catch {
//                        completion(false, error)
//                    }
//                }
//            }
//            completion(true, nil)
//    }
//    
//    
//    public static func deleteAll() {
//        do {
//            self.allObjects.forEach {
//                $0.audioDownloadState = 0
//            }
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    
//    public func saveLastPlayedTimeAt(time: TimeInterval) {
//        do {
//            self.savedTrackTime = time
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    public func updateProgressTime(_ time: TimeInterval, lastProgressTime: Double) {
//        do {
//            self.lastPlayedTime = time
//            self.lastProgressTime = lastProgressTime
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    public func updateLastPlayed(audio: Bool) {
//        
//        // remove the last saved audio to false and then update on the new audio played to true in database
//        self.removeLastPlayedAudioBook()
//        do {
//            self.isLastPlayed = true
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    public func removeLastPlayedAudioBook() {
//        do {
//            let audioBooks = Audiobook.allObjects
//            for audioBook in audioBooks {
//                audioBook.isLastPlayed = false
//            }
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    public static func updateAudioBooksStatusToPaid() {
//        do {
//            let audioBooks = Audiobook.allObjects
//            for audioBook in audioBooks {
//                audioBook.audioPurchaseState = 2
//            }
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//}
//
//extension Audiobook: JSONCoreDataParsable {
//    
//    public static var primaryKeyValues: [PrimaryKey] {
//        return [
//            PrimaryKey(
//                keypath: "urlId",
//                jsonKeypath: "urlId"
//            )
//        ]
//    }
//    
//    public func update(json: JSON) throws {
//        do {
//            self.name = try json["name"]^
//            self.spanishName = try json["spanishName"]^
//            let index: Int16 = try json["index"]^
//            self.index = index
//            self.urlId = try json["urlId"]^
//            self.bookName = try json["bookName"]^
//            self.trackTimeMale = try json["trackTime_male"]^
//            self.trackTimeFemale = try json["trackTime_female"]^
//            self.audioPurchaseState = index == 1 ? 0 : 1
//        } catch {
//            throw error
//        }
//    }
//    
//    public var docUrl: URL {
//        if self.bookName == "Firefighter I" {
//            return HazmatAPIClient.shared.createFileURL(pathComponent: "ff1_ch\(self.urlId)_m.mp3")
//        } else {
//            if let chapterIndex = Int(self.urlId) {
//                       let adjustedIndex = chapterIndex - 16
//                       return HazmatAPIClient.shared.createFileURL(pathComponent: "ff2_ch0\(adjustedIndex)_m.mp3")
//            } else {
//                return HazmatAPIClient.shared.createFileURL(pathComponent: "invalid_url.mp3")
//            }
//        }
//        
//    }
//    
//    public var femaleDocUrl: URL {
//        if self.bookName == "Firefighter I" {
//            return HazmatAPIClient.shared.createFileURL(pathComponent: "ff1_ch\(self.urlId)_f.mp3")
//        } else {
//            if let chapterIndex = Int(self.urlId) {
//                       let adjustedIndex = chapterIndex - 16
//                       return HazmatAPIClient.shared.createFileURL(pathComponent: "ff2_ch0\(adjustedIndex)_f.mp3")
//            } else {
//                return HazmatAPIClient.shared.createFileURL(pathComponent: "invalid_url.mp3")
//            }
//        }
//    }
//    public var remoteUrl: URL {
//        let channelId = "ch\(self.urlId)"
//            let formattedUrl = APIConfig.maleBaseUrl
//                .replacingOccurrences(of: "ch01", with: channelId)
//                .replacingOccurrences(of: "_m", with: "_m.mp3")
//        return URL(string: formattedUrl)!
//    }
//    
//    public var remoteUrl2: URL {
//        if let chapterIndex = Int(self.urlId) {
//            let adjustedIndex = chapterIndex - 16
//            let channelId = "ch0\(adjustedIndex)"
//            let formattedUrl = APIConfig.maleBaseUrl2
//                .replacingOccurrences(of: "ch01", with: channelId)
//                .replacingOccurrences(of: "_m", with: "_m.mp3")
//            return URL(string: formattedUrl)!
//        }
//        return URL(string: "")!
//    }
//    
//    public var femaleRemoteURL: URL {
//        let channelId = "ch\(self.urlId)"
//            let formattedUrl = APIConfig.femaleBaseUrl
//                .replacingOccurrences(of: "ch01", with: channelId)
//                .replacingOccurrences(of: "_f", with: "_f.mp3")
//        return URL(string: formattedUrl)!
//    }
//    
//    public var femaleRemoteURL2: URL {
//        
//        if let chapterIndex = Int(self.urlId) {
//            let adjustedIndex = chapterIndex - 16
//            let channelId = "ch0\(adjustedIndex)"
//            let formattedUrl = APIConfig.femaleBaseUrl2
//                .replacingOccurrences(of: "ch01", with: channelId)
//                .replacingOccurrences(of: "_f", with: "_f.mp3")
//            return URL(string: formattedUrl)!
//        }
//        return URL(string: "")!
//    }
//    
//    
// 
//}
//
//// MARK:- TIME BASED BOOKMARKS HANDLE
//// This code is considering notes as bookmark
//public extension Audiobook {
//
//    var notesList: [Bookmark] {
//        return self.bookmarks.allObjects as! [Bookmark]
//    }
//    
//    func addNote(title: String, duration: TimeInterval) {
//        let json = JSON(["title": title, "duration": duration])
//        do {
//            let note = try Bookmark.parse(json)
//            self.addToBookmarks(note)
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//
//    func removeNote(bookmark: Bookmark) {
//        do {
//            self.removeFromBookmarks(bookmark)
//            context.delete(bookmark)
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//
//}
