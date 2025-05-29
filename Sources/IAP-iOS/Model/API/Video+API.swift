//
//  Video+API.swift
//  Model
//
//  Created by Sagar Nagpal on 02/05/22.
//  Copyright © 2022 AppCenter. All rights reserved.
//

//import Foundation
//import FoxAPIKit
//import ReactiveSwift
//import RealmSwift
////import Model
//
//public extension Video {
//    
//    
//    func cancelDownloadVideo(pathComponent: String) {
//        self.downloadTask?.cancel()
//    }
//    
//    func downloadVideo(pathComponent: String, videoUrl: URL, downloadProgressed: @escaping (FileProgress) -> Void, completion: @escaping (Bool) -> Void) {
//        
//        self.downloadTask = URLSession.shared.downloadTask(with: videoUrl, completionHandler: { localUrl, _, error in
//            if let error = error {
//                print("Error while downlaoding video: ", error)
//                
//                DispatchQueue.main.async {
//                    self.updateDownload(value: DownloadState.notDownloaded.rawValue)
//                    completion(false)
//                }
//                return
//            }
//            
//            if let localUrl = localUrl {
//                guard let data = try? Data(contentsOf: localUrl) else {
//                    completion(false)
//                    return
//                }
//                let destinationPath = self.createFileURL(pathComponent: pathComponent)
//                
//                try? data.write(to: destinationPath, options: .atomic)
//                
//                try? FileManager.default.removeItem(at: localUrl)
//                DispatchQueue.main.async {
//                    self.updateDownload(value: DownloadState.downloadComplete.rawValue)
//                    completion(true)
//                }
//            }
//        })
//        
//        self.observation = downloadTask?.progress.observe(\.fractionCompleted, changeHandler: { progress, _ in
//            print("Downlaoding using URLSession: ", progress.fractionCompleted)
//            DispatchQueue.main.async {
//                downloadProgressed(progress)
//            }
//        })
//        self.downloadTask?.resume()
//        
//    }
//    
//    func createFileURL(pathComponent: String) -> URL {
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileURL = documentsURL.appendingPathComponent(pathComponent)
//        return fileURL
//    }
//}
