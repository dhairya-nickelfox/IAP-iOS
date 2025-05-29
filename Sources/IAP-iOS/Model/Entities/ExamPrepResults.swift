//
//  ExamPrepResults.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class ExamPrepResults: Object {
    @objc dynamic var date = Date()
    @objc dynamic var chapterId = ""
    @objc dynamic var chapterName = ""
    @objc dynamic var questionStatus = ""
}
