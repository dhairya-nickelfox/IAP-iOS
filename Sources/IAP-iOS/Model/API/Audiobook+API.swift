//
//  Audiobook+API.swift
//  Model
//
//  Created by Akanksha Trivedi on 15/02/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//
// swiftlint:disable all

//import Foundation
//
//public extension Audiobook {
//    
//    func downloadAudio(isFirefighterI: Bool,downloadProgressed: @escaping (FileProgress) -> Void,
//                       downloaded: @escaping (Bool) -> Void) {
//        let router = AudioRouterEnglish.download(urlId: self.urlId)
//        let adjustIndex = Int(self.index) - 16
//        HazmatAPIClient.shared.downloadFile(
//            isFirefighterI: isFirefighterI,
//            index: adjustIndex,
//            router: router,
//            pathComponent: self.urlId,
//            downloadProgress: { downloadProgress in
//                downloadProgressed(downloadProgress)
//            }) { result in
//                switch result {
//                case .success:
//                    self.updateDownload(value: Int16(DownloadState.downloadComplete.rawValue))
//                    downloaded(true)
//                case .failure:
//                    self.updateDownload(value: Int16(DownloadState.notDownloaded.rawValue))
//                    downloaded(false)
//                }
//            }
//    }
//    
//    
//    
//    func cancelDownload(pathComponent: String) {
//        HazmatAPIClient.shared.cancelDownload(pathComponent: pathComponent)
//    }
//    
//}
