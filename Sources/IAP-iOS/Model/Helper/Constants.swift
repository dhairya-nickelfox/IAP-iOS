//
//  Constants.swift
//  HazmatFirstResponderSixth
//
//  Created by Ravindra Soni on 11/12/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    struct ProductIdentifier {
        static let appStoreAppId = "6469591173"
        static let examPrepProductIdentifier = "org.ifsta.e8.examprep"
        static let audiobookProductIdentifier = "org.ifsta.e8.audiobook"
        static let coursesProductIdentifier = "org.ifsta.e8.interactive"
    }
    
    static let ok = "Ok"
    static let yes = "Yes"
    static let no = "No"
    static let reset = "Reset"
    static let cancel = "Cancel"
    static let oops = "Oops!"
    static let successfullyDeleted = "successfully deleted"
    static let selected = "Selected"
    static let allSelected = "All Selected"
    static let floatAlertView = "FloatAlertView"
    static let alert = "alert"
    static let langEnglishCode = "en"
    static let noInternet = "No Internet Connection"
    static let welcome = "Welcome"
    static let welcomeCellModelText = "We have been waiting for you, lets begin!"
    static let bookmarkRemoved = "bookmark removed"
    static let bookmarked = "bookmarked"
    static let cancelDownloads = "Cancel Downloads"
    static let cancelDownload = "Cancel Download"
    static let alreadyBookmarkedAudio = "bookmarked_audio"
    static let bookmarkAudio = "bookmark_audio"
    static let attemptedQuestion = "ATTEMPTED"
    static let unAttemptedQuestion = "UNATTEMPTED"
    static let selectBook = "Select Book"
    static let firefighterI = "Firefighter I"
    static let firefighterII = "Firefighter II"
    static let homeAboutUsCellModelText =
    """
The Essentials of Fire Fighting, 8th Edition, Manual provides entry-level firefighter candidates with the basic \
information necessary to meet the job performance requirements (JPRs) in Chapter 6, Firefighter I and Chapter 7, \
Firefighter II of NFPA 1010, Standard on Professional Qualifications for Firefighters, 2024 Edition.
"""
    
    static let homeExamPrepCellModelText =
   """
Use the 1,271 IFSTA®-validated Exam Prep questions to confirm your understanding of the content in \
the Essentials of Fire Fighting, 8th Edition, Manual. The Exam Prep covers all 23 chapters of the Manual. \
Exam Prep tracks and records your progress, allowing you to review your exams and study your weaknesses. \
In addition, your missed questions are automatically added to your study deck. This feature requires an \
in-app purchase. All users have free access to Chapter 1.
"""
    static let homeInteractiveCellText =
        """
        Access visually engaging, self-paced interactive modules covering the learning objectives \
        in all 23 chapters of Essentials of Fire Fighting, 8th Edition: Firefighter I and II. \
        Each module combines text, images, videos, interactivity and knowledge checks to enhance \
        the learning experience. This feature requires an in-app purchase and includes both \
        Firefighter I and II. All users have free access to Firefighter I: Chapter 1.
        """

    
    static let HomeflashCardCellModelText =
    """
Review all 605 key terms and definitions found in all 23 chapters between Essentials of \
Fire Fighting, 8th Edition: Firefighter I and II with Flashcards. Study selected chapters \
or combine the deck together. This feature is FREE for all users.

"""
    
    static let HomeIdentifyCellModelText =
    """
Test your tool and equipment identification knowledge with this feature, which includes 300 \
photo identification questions. This feature is FREE for all users.
"""
    
    static let AudioBookCellModelText =
    """
Purchase the Essentials of Fire Fighting, 8th Edition, Audiobook through this IFSTA App. \
All 23 chapters are narrated in their entirety for 18 hours of content. Features include \
offline access, bookmarks, and the ability to listen at your own speed. This feature \
 requires an in-app purchase and includes both Firefighter I and II. All users have \
free access to Firefighter I: Chapter 1.
"""
    struct AudioBook {
        static let audioBook = "Audiobook"
    }
    
    struct More {
        static let more = "More"
    }
    struct Video {
        static let initializedVideos = "initVideos"
        static let isVideoContentUnlocked = "isVideoContentUnlocked"
        static let vimeoClientIdentifier = "7848bdf6cb2ae8326444b50ef91bd1eadc5e22fd"
        static let vimeoClientSecret = "OSHSTTUj+0WJkmkG10fA0oKGgO85U6teRLSQpjN0LYgAb7KUGcPK10gj6u7YFkVxD4BBOEGaYTEAvbg+04dwB2OE2HQLEbW1JBrnQHp/9B5IfRhkgWwziiF0sErS5P8k"
        static let vimeoAccessToken = "82c907abc0661f0ab510ad2f1aaab47e"
        static let skillSheetRobotoBoldFont = UIFont(name: "Roboto-Bold", size: 14.0)!
        static let skillSheetRobotoRegularFont = UIFont(name: "Roboto-Regular", size: 14.0)!
        static let fileExtension = ".mp4"
        static let serachPlaceHolder = "Search for a video"
        static let allVideos = "All Videos"
        static let skillVideos = "Skill Videos"
        static let skill = "Skill Videos"
        static let removeDownloadedVideo = "Are you sure you want to remove the downloaded videos from your device?"
        static let canBeDownloadAgain = "They will be availaible for download again."
        static let myQueue = "myQueue"
    }
    
    struct Course {
        static let course = "Courses"
        static let interactive = "Interactive"
    }
    
    struct Message {
        static let aboutus = "About"
        static let fireemergency = "HazMat First Responders"
        static let fullysearchable = "Fully searchable text"
        static let purchaseAt = "Find more eBooks at :"
        static let offlineDownload = "Download offline"
        static let identify = "Identify"
        static let courses = "Courses"
        static let videos = "Skill Videos"
        static let buynow = "Buy eBook"
        static let all = "All"
        static let bookmarked = "Bookmarks"
        static let downloads = "Downloads"
        static let chapter = "Chapter "
        static let download = "Download All"
        static let listenMore = "Listen more"
        static let buyall = "Buy All"
        static let audiobook = "AudioBook"
        static let deleteAll = "Delete All"
        static let emptyText = "No bookmarks"
        static let home = "Home"
        static let more = "More"
        static let add = "Add"
        static let cancel = "Cancel"
        static let bookmark = "Bookmarks"
        static let errorMessage = "Empty bookmark title"
        static let deletedownload = "Delete downloaded"
        static let confirmDownload = "Confirm download"
        static let downloadaudio = "Download"
        static let message = "Are you sure you want to delete all chapters?"
        static let messagedelete = "Are you sure you want to delete chapters?"
        static let noAudiobookToDelete = "Currently no audiobook is available offilne to delete!"
        static let ok = "Ok"
        static let internetmessagetittle = "No Internet Connection"
        static let internetmessage =  "Please connect to internet to listen chapters."
        static let messagedownload = "Press Ok to download and listen to chapters offline"
        static let trackBookmark =  "Track Bookmark."
        static let messagedownloadfirst = "Please download chapters audio first in order to save tracks"
        static let deleted = "Deleted"
        static let audioBookDeleted = "Chapter deleted"
        static let downloadedaudio = "Downloaded"
        static let audioBookDownloaded = "Chapter downloaded"
        static let updateRequired = "Update Required"
        static let update = "Update"
        static let language = "Language"
        static let languageSelected = "English (United States)"
        static let languageSettings = "Settings"
        static let videoButton = "Videos"
        static let settings = "Settings"
        static let identifyButton = "Identify"
        static let noVideoToDelete = "Currently no video is available offilne to delete!"
        static let downloadedAllChapters = "All chapters downloaded"
        static let noDownloads = "No downloads yet"
        static let noDownloadsFound = "No downloads found"
        static let noAudioBookDownloaded = "Currently no audiobook is available offline to delete!"
        static let downloadMessage = "Please download audio first in order to save tracks"
        static let downloadChapterTitle = "Download chapter"
        static let downloadChapter = "Press Ok to download and listen chapter offline"
        static let downloadAllChapterTitle = "Download All"
        static let downloadAllChapter = "Are you sure you want to download all audiobooks? This might take a while."
        static let deleteChapterTitle = "Delete chapter"
        static let deleteChapter = "Are you sure you want to delete this chapter? You can download it again."
        static let noInternet = "No Internet Connection"
        static let connectInternetMessage = "Please connect to internet to listen audiobooks."
        static let emptyBookmark = "Empty bookmark title"
        static let noBookmarks = "No bookmarks yet"
        static let noBookmarksFound = "No bookmarks found"
        static let isAudioBookContentUnlocked = "isAudiobookContentUnlocked"
        static let isAVPlayerActive = "audiobookpalyerIsActive"
        static let okTitle = "Ok"
        static let yesTitle = "Yes"
        static let cancelTitle = "Cancel"
        static let oopsTitle = "Oops!"
        static let deleteDownloaded = "Delete downloads?"
        static let deleteAllChapters = "Are you sure you want to delete all chapters? They will still be available to download again."
        static let deletedAllChapters = "Selected downloaded chapters are deleted."
        static let deleteAudio = "Delete"
        static let selectOneAudio = "Select at least one Audiobook"
        static let selectOneVideo = "Select at least one Video"
        static let audiobooksTitle = "Audiobooks"
        static let deleteSelected = "Delete Selected"
        static let downloadSelected = "Download Selected"
        static let goBack = "Are you sure you want to go back?"
        static let downloaded = ""
        static let filesDeleted = "File(s) deleted successfully"
        static let repeatedTimeNote = "A note with the same time already exist"
        static let repeatedMessageNote = "A note with the same title already exist"
        static let downloadIsInProgress = "Download is already in progress."
        static let noVideo = "No video yet"
        static let noVideoFound = "No video found"
        static let noAudioFound = "No audiobook found"
        static let noAudio = "No audiobook yet"
        static let flashCard = "Flashcard"
    }
    
    struct ExamPrep {
        static let examPrep = "Exam Prep"
        static let versionNumberKey = "versionNumberKey"
        static let versionNumber: Float = 1.0
        static let initializedExamPrepChapters = "initializedExamPrepChapters"
        static let initializedExamPrepQuestions = "initializedExamPrepQuestions"
        static let isExamPrepContentUnlocked = "isExamPrepContentUnlocked"
        static let studyDeskEmpty = "No questions are in the study deck."
        static let clearReports = "Clear all test results?"
        static let noReports = "No reports available."
        static let reportsCleared = "Reports cleared for all chapters."
        static let endQuiz = "Exit"
        static let scoreAndExit = "Score and Exit"
        static let checkResults = "Check Results"
        static let exitWithoutScore = "Exit without Score"
        static let areYouSureYouWantToExit = "Are you sure you want to exit"
        static let reset = "Reset"
        static let studyDeckEmpty = "No questions are in the study deck."
        static let clearStudyDesk = "Remove all questions from study deck?"
        static let studyDeckCleared = "Removed all chapters from study deck."
        static let viewReports = "View Reports"
        static let selectExams = "Select Exams"
    }
    
    struct UpdateApp {
        static let updateRequired = "Update Required\n"
        static let updateMessage = "Your app version is outdated. Please update to continue."
    }
    
    struct IAP {
        static let error = "Error"
        static let purchase = "Purchase"
        static let purchaseComplete = "Purchase Complete"
        static let noPurchasedRestore = "There are no purchased items to restore."
        static let previousPurchasesRestored = "Previous In-App Purchases have been restored!"
        static let dummyPurchase = "Product identifier is not available, it will be a dummy purchase for testing."
        static let buyingItemNotPossible = "Buying this item is not possible at the moment."
        static let noProductIdentifiersFound = "No In-App Purchase product identifiers were found."
        static let noIAPFound = "No In-App Purchases were found."
        static let unableToFetchProduct = "Unable to fetch available In-App Purchase products at the moment."
        static let iapProcessCancelled = "In-App Purchase process was cancelled."
        static let unknownError = "Unknown Error"
        static let audioBookModule = "This purchase includes both the Firefighter I & Firefighter II Audiobook"
        static let examPrepModule = "This purchase includes both the Firefighter I & Firefighter II Exam Prep"
        static let courseModule = "This purchase includes both the Firefighter I & Firefighter II Interactive"
    }
    
    struct Home {
        static let home = "Home"
        static let about = "About"
        static let learnMore = "Learn More"
    }
    
    
    struct VoiceType {
        static let voiceType = "VoiceType"
        static let male = "Male"
        static let female = "Female"
    }
    
    struct Flashcard {
        static let flashcard = "Flashcard"
        static let offlineFlashCard = "offline_flashcards"
        static let json = "json"
    }
    
    struct RealmConfig {
        @MainActor static var currentSchemaVersion = 5
    }
    
    struct Identify {
        static let identifyTitle = "Tool and Equipment Identification"
    }
    
    struct Font {
        static let PoppinsRegular = "Poppins-Regular"
        static let PoppinsSemiBold = "Poppins-SemiBold"
        static let LatoRegular = "Lato-Regular"
        static let LatoMedium = "Lato-Medium"
        static let LatoBold = "Lato-Bold"
        static let HelveticaNeueBold = "Helvetica Neue Bold"
    }
    
    struct ExamPrepChapters {
        static let chapter1 = "Introduction to the Fire Service and Firefighter Safety"
        static let chapter2 = "Operational Scene Safety and Management"
        static let chapter3 = "Communications"
        static let chapter4 = "Building Construction"
        static let chapter5 = "Fire Dynamics"
        static let chapter6 = "Firefighter Personal Protective Equipment"
        static let chapter7 = "Portable Fire Extinguishers"
        static let chapter8 = "Ropes and Knots"
        static let chapter9 = "Ground Ladders"
        static let chapter10 = "Forcible Entry"
        static let chapter11 = "Structural Search and Rescue"
        static let chapter12 = "Tactical Ventilation"
        static let chapter13 = "Fire Hose, Hose Operations, and Hose Streams"
        static let chapter14 = "Fire Suppression"
        static let chapter15 = "Overhaul, Property Conservation, and Scene Preservation"
        static let chapter16 = "First Aid Provider"
        static let chapter17 = "Incident Scene Operations"
        static let chapter18 = "Building Materials, Structural Collapse, and Effects of Fire Suppression"
        static let chapter19 = "Technical Rescue Support and Vehicle Extrication Operations"
        static let chapter20 = "Foam Fire Fighting, Liquid Fires, and Gas Fires"
        static let chapter21 = "Fire Origin and Cause Determination"
        static let chapter22 = "Maintenance and Testing Responsibilities"
        static let chapter23 = "Community Risk Reduction"
        
    }
}

extension NSLayoutConstraint {
    
    func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

