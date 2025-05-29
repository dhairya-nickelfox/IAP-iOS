//
//  HazmatAPIClient.swift
//  Model
//
//  Created by Nickelfox on 01/11/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

//import Foundation
//import FoxAPIKit
//import Alamofire
//
//public typealias FileProgress = Alamofire.Progress
//public typealias CoreResult<T> = Swift.Result<T, Error>
//
//class HazmatAPIClient: APIClient<AuthHeaders, ErrorResponse> {
//    
//    private var lastUpdateTimeUptimeNanoseconds: UInt64 = DispatchTime.now().uptimeNanoseconds
//    static let shared = HazmatAPIClient()
//    let firefighterIAudioBook = "ff1_ch"
//    let firefighterIIAudioBook = "ff2_ch0"
//    private var downloadRequests: [String: Alamofire.Request] = [:]
//    
//    override init() {
//        super.init()
//        #if DEBUG
//        enableLogs = true
//        #else
//        enableLogs = false
//        #endif
//    }
//    
//    override func authenticationHeaders(response: HTTPURLResponse) -> AuthHeaders? {
//        return self.authHeaders
//    }
//    
//}
//
//extension HazmatAPIClient {
//    
//    public func createFileURL(pathComponent: String) -> URL {
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileURL = documentsURL.appendingPathComponent(pathComponent)    // like "image.png"
//        print("FileURL is \(fileURL.absoluteString)")
//        return fileURL
//    }
//    
//    func downloadFile(isFirefighterI: Bool,
//                      index: Int,
//                      router: Router,
//                      pathComponent: String,
//                      downloadProgress: @escaping (FileProgress) -> Void,
//                      completion: @escaping (CoreResult<[URL]>) -> Void) {
//        
//        let dispatchGroup = DispatchGroup()  // Used for tracking multiple downloads
//        var downloadedFiles = [URL]()        // Store the downloaded file URLs
//        var downloadErrors = [Error]()       // Store any errors encountered during download
//
//        let queue = DispatchQueue.global(qos: .userInteractive)
//        
//        // Helper function to handle individual file downloads
//        func downloadSingleFile(modifiedUrlString: String, suffix: String) {
//            dispatchGroup.enter()
//            
//            let configuration = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).fileDownload.\(pathComponent)_\(suffix)")
//            configuration.timeoutIntervalForRequest = 600
//
//            guard let modifiedUrl = URL(string: modifiedUrlString) else {
//                dispatchGroup.leave()
//                return
//            }
//
//            let manager = Alamofire.SessionManager(configuration: configuration)
//            let destination: Alamofire.DownloadRequest.DownloadFileDestination = { (_, _) in
//                let fileURL = self.createFileURL(pathComponent: isFirefighterI ? 
//                "\(self.firefighterIAudioBook)\(pathComponent)_\(suffix).mp3"
//                :
//                "\(self.firefighterIIAudioBook)\(index)_\(suffix).mp3")
//                return (fileURL, [.removePreviousFile])
//            }
//
//           let request = manager.download(modifiedUrl,
//                             method: router.method,
//                             parameters: router.params,
//                             encoding: JSONEncoding.default,
//                             headers: router.headers,
//                             to: destination)
//                .downloadProgress(queue: .main) { progress in
//                    debugPrint("path: \(pathComponent)_\(suffix)", "file progress: ", progress.fractionCompleted)
//                    if suffix == "m" {
//                        downloadProgress(progress)
//                    }
//                }
//                .response { response in
//                    manager.session.finishTasksAndInvalidate()
//                    DispatchQueue.main.async {
//                        if let error = response.error {
//                            downloadErrors.append(error)
//                        } else if let url = response.destinationURL {
//                            downloadedFiles.append(url)
//                        }
//                        dispatchGroup.leave()
//                    }
//                }
//            downloadRequests[
//                isFirefighterI ? "\(self.firefighterIAudioBook)\(pathComponent)_\(suffix).mp3" : "\(self.firefighterIIAudioBook)\(pathComponent)_\(suffix).mp3"
//            ] = request
//
//            
//        }
//
//      
//        
//        guard let url = router.urlRequest?.url else { return }
//        
//        var modifiedUrlStringM: String = ""
//        var modifiedUrlStringF: String = ""
//        
//        if isFirefighterI {
//            modifiedUrlStringM = url.absoluteString.replacingOccurrences(of: pathComponent, with: "\(self.firefighterIAudioBook)\(pathComponent)_m.mp3")
//            modifiedUrlStringF = url.absoluteString.replacingOccurrences(of: pathComponent, with: "\(self.firefighterIAudioBook)\(pathComponent)_f.mp3")
//        } else {
//            modifiedUrlStringM = url.absoluteString.replacingOccurrences(of: pathComponent, with: "\(self.firefighterIIAudioBook)\(index)_m.mp3")
//            modifiedUrlStringF = url.absoluteString.replacingOccurrences(of: pathComponent, with: "\(self.firefighterIIAudioBook)\(index)_f.mp3")
//        }
//        
//        downloadSingleFile(modifiedUrlString: modifiedUrlStringM, suffix: "m")
//        downloadSingleFile(modifiedUrlString: modifiedUrlStringF, suffix: "f")
//        
//        dispatchGroup.notify(queue: .main) {
//            if downloadErrors.isEmpty {
//                completion(.success(downloadedFiles))
//            } else {
//                // Return an error if any download failed
//                completion(.failure(downloadErrors.first!))
//            }
//        }
//    }
//    
//    func cancelDownload(pathComponent: String) {
//        for (suffix, request) in downloadRequests {
//            if request.task?.state == .running {
//                request.cancel()
//                print("Cancelled download for \(suffix) in \(pathComponent)")
//            }
//        }
//        let configuration = URLSessionConfiguration.background(
//            withIdentifier: "\(Bundle.main.bundleIdentifier!).fileDownload.\(pathComponent)"
//        )
//        configuration.timeoutIntervalForRequest = 600
//        let manager = Alamofire.SessionManager(configuration: configuration)
//        manager.session.invalidateAndCancel()
//    }
//    
//    
//}
