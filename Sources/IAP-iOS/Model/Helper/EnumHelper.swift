//
//  EnumHelper.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

enum ListType {
    case examPrep
    case reports
    case studyDeckList
}

enum BookType: String {
    case firefighterI = "Firefighter I"
    case firefighterII = "Firefighter II"
    case both = "Both"
    
    var type: String {
        switch self {
        case .firefighterI:
            "Firefighter I"
        case .firefighterII:
            "Firefighter II"
        case .both:
            "Both"
        }
    }
    
    var prefix: String {
        switch self {
        case .firefighterI:
            "ff1_"
        case .firefighterII:
            "ff2_"
        default:
            ""
        }
    }
    
}

enum VoiceType {
    case male
    case female
    
    var suffix: String {
        switch self {
        case .male:
            "_m"
        case .female:
            "_f"
        }
    }
}

enum Settings {
    case examPrep
    case audio
    
    static func getSettings(forModule: Settings) -> [String] {
        switch forModule {
        case .examPrep:
            return  ["Clear test results", "Clear Study deck"]
        case .audio:
            return  ["Download All", "Delete All"]
        }
    }
}


enum Option {
    case delete
    case download
}


enum Queue {
    
    case add
    case remove
}


enum AudioPlayerAction {
    case next
    case previous
}


enum ShowButton {
    case download
    case delete
    case cancel
    case buy
    case cancelDownload
    
    var titleColor: UIColor {
        return (self == .cancel ||
                self == .delete ||
                self == .cancelDownload) ? Color.redColor : Color.primaryColor
    }
    
    var buttonImage: UIImage? {
        return self == .cancelDownload ? Image.ExamPrep.redCross.image : nil
    }
}


enum NavigationType {
    case practiceExam
    case studyDeck
    
    var typeTitle: String {
        return self == .practiceExam ? "Practice Exam" : "Study Deck"
    }
}


enum IdentifyNextQuestionCellButtonType {
    case next
    case skip
}


enum IdentifyStartButton {
    case begin
    case reset
    
    var title: String {
        switch self {
        case .begin:
            return "Let's Begin"
        case .reset:
            return "Reset Progress"
        }
    }
}


enum IdentifyModuleProgress {
    case completed
    case notCompleted
    case progress
}


enum VideoType {
    case parent
    case subVideo
}


enum VideoPlayMode: String {
    case offline = "Offline"
    case online = "Online"
}


enum QuestionType: String {
    case attempted = "ATTEMPTED"
    case unattempted = "UNATTEMPTED"
}

enum ListSegment: Int {
    case all
    case downloads
    case bookmarks
    
    
    var title: String {
        switch self {
        case .all:
            return "allAudiobooks"
        case .downloads:
            return "downloads"
        case .bookmarks:
            return "bookmarks"
        }
    }
    
    var index: Int {
        switch self {
        case .all:
            return 0
        case .downloads:
            return 1
        case .bookmarks:
            return 2
        }
    }
}

enum AudioBookType {
    case male
    case female
}

enum IAPModule {
    case audioBook
    case examPrep
    case course
}

enum BookName: String {
    case firefighterI = "Firefighter I"
    case firefighterII = "Firefighter II"
}
