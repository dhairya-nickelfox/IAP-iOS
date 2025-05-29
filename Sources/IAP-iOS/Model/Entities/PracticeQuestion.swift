//
//  PracticeQuestion.swift
//  Model
//
//  Created by Akanksha Trivedi on 23/10/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

public class PracticeQuestion: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var chapterID = 0
    @objc dynamic var chapterName = ""
    @objc dynamic var questionId = ""
    @objc dynamic var questionText = ""
    @objc dynamic var optionA = ""
    @objc dynamic var optionB = ""
    @objc dynamic var optionC = ""
    @objc dynamic var optionD = ""
    @objc dynamic var correctAnswer = ""
    @objc dynamic var referencePage = ""
    @objc dynamic var questionImage = ""
    @objc dynamic var questionType = ""
    @objc dynamic var inStudyDeck = false
    @objc dynamic var didAnswerCorrect = false
    @objc var userAnswer = ""
    @objc var correctAnswerText = ""
    @objc dynamic var qID = ""
    @objc dynamic var bookType = ""
    var cellModels: [Any] = []
    public override class func primaryKey() -> String? {
        return "qID"
    }
    
    // Increment id
    func incrementID() -> Int {
        var realm: Realm {
            do {
                return try Realm()
            } catch let error {
                fatalError("Error initializing Realm: \(error)")
            }
        }
        
        return (realm.objects(PracticeQuestion.self).max(ofProperty: "id") as Int? ?? 0)
    }
    
    // Inverse relationship
    let chapter = LinkingObjects(fromType: Chapter.self, property: "practiceQuestions")
    
}



