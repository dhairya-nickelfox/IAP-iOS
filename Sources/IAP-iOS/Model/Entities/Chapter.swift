//
//  Chapter.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 23/10/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import RealmSwift
import Foundation

class Chapter: Object {
    
    @objc dynamic var chapterId = -1
    @objc dynamic var chapterName = ""
    @objc dynamic var questionCount = -1
    @objc dynamic var score = 0
    @objc dynamic var correctAttempts = 0
    @objc dynamic var incorrectAttempts = 0
    let practiceQuestions = List<PracticeQuestion>()
    @objc dynamic public var purchaseState = 0
    @objc var studyDeckQuestions = 0
    @objc dynamic var bookType = ""
    @objc dynamic var uniqueID = 1
    override static func primaryKey() -> String? {
        return "chapterId"
    }
    
}
