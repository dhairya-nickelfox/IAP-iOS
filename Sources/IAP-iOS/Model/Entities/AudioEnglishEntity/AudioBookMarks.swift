//
//  AudioBookMarks.swift
//  Model
//
//  Created by Nickelfox on 01/12/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import RealmSwift

public class AudioBookMarks: Object {
    @objc dynamic public var bookmarkName: String = ""
    @objc dynamic public var duration: Double = 0.0
//    @objc dynamic public var chapterId: Int = 0 // { get }
}
