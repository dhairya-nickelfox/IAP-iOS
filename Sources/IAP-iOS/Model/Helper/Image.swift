//
//  Image.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 07/11/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

public struct Image {
    
    enum Splash: String {
        case launchImage = "LaunchImage"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    enum Home: String {
            case selectedHome = "homeSelected"
            case unselectedHome = "homeUnselected"
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
    enum ExamPrep: String {
        case checkedIcon = "CheckedBoxIcon"
        case uncheckedIcon = "UncheckedBoxIcon"
        case incorrectAnswerIcon = "IncorrectAnswerIcon"
        case correctAnswerIcon = "CorrectAnswerIcon"
        case checkedWhiteBoxIcon = "checkedWhiteBoxIcon"
        case correctAnswer = "correct_answer"
        case incorrectAnswer = "incorrect_answer"
        case downloadAll = "downloadAll"
        case buyAll = "buy_All"
        case deleteAllRed = "deleteAllRed"
        case redCross = "red_cross"
        case backgroundPhoneImage = "bg_phone"
        case backgroundPadPortraitImage = "bg_pad_portrait"
        case backgroundPadLanscapeImage = "bg_pad_landscape"
        case examPrepSelectedTab = "examprepSelected"
        case examPrepUnselectedTab = "examprepunselected"
      
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
        
    }
    
    enum Flashcards: String {
        case flashcardSelectedTab = "flashcardSelected"
        case flashcardUnSelectedTab = "flashcardUnselected"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
    enum IAP: String {
        case appLogoIPhone = "app_logo_iPhone"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
    enum Video: String {
        case unselectedVideo = "video_updated"
        case selectedVideo = "video_updated_yellow"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
        
    }
    
    enum Course: String {
        case unselectedCourse = "courses_updated"
        case selectedCourse = "courses_updated_yellow"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
        
    }
    
    enum AudioBook: String {
        case unSelectedBook = "audioBookUnselected"
        case selectedBook = "audioBookSelected"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
}


extension Image {
    enum All: String {
        case appLogoIPad = "app_logo_iPad"
        case appLogoIPhone = "app_logo_iPhone"
        case buyAll = "buy_All"
        case backgroundPhoneImage = "bg_examprep"
        case backgroundPadLanscapeImage = "bg_pad_landscape"
        case backward30 = "backward_30_audio"
        case backward = "backward_audio"
        case bookmark = "bookmark_audio"
        case bookmarked = "bookmarked_audio"
        case correctAnswer = "correct_answer"
        case correctAnswerIcon = "CorrectAnswerIcon"
        case checkedWhiteBoxIcon = "checkedWhiteBoxIcon"
        case checkedIcon = "CheckedBoxIcon"
        case courseInProgress = "courseInProgress"
        case courseCompleted = "courseCompleted"
        case courseIcon = "coursedefault"
        case coverImage = "audioLogo"
        case downloadAudio = "downloadAudio"
        case downloadAllWhite = "downloadAllWhite"
        case dropDown = "dropDown"
        case delete = "delete_audio"
        case deleteVideo = "deleteVideo"
        case downloadAll = "downloadAll"
        case deleteAllRed = "deleteAllRed"
        case downloadedGreen = "downloadedGreen"
        case darkBookmark = "dark_bookmark_audio"
        case darkBookmarked = "dark_bookmarked_audio"
        case darkPause = "dark_pause_audio"
        case darkPlay = "dark_play_audio"
        case darkLargePause = "dark_largePause_audio"
        case darkLargePlay = "dark_largePlay_audio"
        case disabledBackward = "disabled_backward_audio"
        case disabledForward = "disabled_forward_audio"
        case downArrow = "down_arrow_audio"
        case download = "download_audio"
        case forward30 = "forward_30_audio"
        case forward = "forward_audio"
        case goBack = "back_icon"
        case incorrectAnswerIcon = "IncorrectAnswerIcon"
        case incorrectAnswer = "incorrect_answer"
        case menu = "menu_audio"
        case none = "none"
        case pause = "pause-audio"
        case play = "play_audio"
        case playDownloadedAudio = "downloaded-audio"
        case redCross = "red_cross"
        case replay = "replay"
        case sliderThumbImage = "sliderThumbImage"
        case uncheckedIcon = "UncheckedBoxIcon"
        case coursesSelectedTab = "courses_updated_yellow"
        case examPrepSelectedTab = "exam_prep_updated_yellow"
        case videosSelectedTab = "video_updated_yellow"
        case coursesUnselectedTab = "courses_updated"
        case examPrepUnselectedTab = "exam_prep_updated"
        case videosUnselectedTab = "video_updated"
      
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
}
