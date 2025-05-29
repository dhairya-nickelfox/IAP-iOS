//
//  SubModuleCellModel.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

enum SubModule {
    case examPrep, audiobook, course

    var tabIndex: Int {
//        switch self {
//        case .examPrep: return TabBarItem.examPrep.rawValue
//        }
        return 0
        
    }

    var title: String {
        switch self {
        case .examPrep:
            return "ExamPrep"
        case .audiobook:
            return "audioBook"
        case .course:
            return "Chapters"
        }
    }
    
    var iconName: String {
        switch self {
        case .examPrep:
            return "exam_prep"
        case .audiobook:
            return "AudiobookIcon"
        case .course:
            return "AudiobookIcon"
        }
    }

    var description: String {
        switch self {
        case .examPrep:
            return """
Use the 502 Exam Prep questions to confirm your understanding of the content in the Chief Officer, 4th Edition manual.
"""
        case .audiobook:
            return """
  \u{2022}  Downloadable and accessible offline.
  \u{2022}  Keep track of notes and sections to review via bookmarks.
  \u{2022}  Listen at your own pace by speeding up or slowing down the reading.
"""
        case .course:
            return """
  \u{2022}  Downloadable and accessible offline.
  \u{2022}  Keep track of notes and sections to review via bookmarks.
  \u{2022}  Listen at your own pace by speeding up or slowing down the reading.
"""
        }
    }
}
struct SubModuleCellModel {
    private let module: SubModule
    
    init(_ module: SubModule) {
        self.module = module
    }
    
    var title: String {
        return self.module.title
    }
    
    var description: String {
        return self.module.description
    }

    var icon: UIImage? {
        return UIImage(named: self.module.iconName)
    }
    
    var index: Int {
        return self.module.tabIndex
    }
}
