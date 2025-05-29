//
//  ExamPrepSettings.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation

class ExamPrepSettings: NSObject {
    @objc var numberOfQuestions = 0
    @objc var includeInStudyDeck = false
    @objc var feedbackStyle = 1
    @objc var correctlyAnswered = 0
    @objc var wronglyAnswered = 0
    @objc var attemptedQuestions = [PracticeQuestion]()
}
