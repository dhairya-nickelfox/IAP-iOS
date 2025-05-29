//
//  ContentStates.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

enum PurchaseState: Int {
    case free
    case notPaid
    case paid
}

enum DownloadState: Int {
    case notDownloaded
    case downloading
    case downloadComplete
    case none
    case downloadingPaused
}

public enum PlayingState: Int {
    case stopped
    case playing
    case paused
    case none
}

enum OptionState: Int {
    case correct
    case incorrect
    case incorrectAttempt
    case unknown
    case none
    case immediateCorrectAnswered
}

public enum IdentifyOptionsState: Int {
    case correct
    case incorrect
    case none
}

enum BookmarkStatus {
    case bookmark, unBookmark
    
    var image: UIImage{
        return UIImage(named: self == .bookmark ? Constant.alreadyBookmarkedAudio : Constant.bookmarkAudio)!
    }
}

