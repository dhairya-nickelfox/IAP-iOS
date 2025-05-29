//
//  AudioNotes.swift
//  Model
//
//  Created by Nickelfox on 01/12/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import RealmSwift

public class AudioNotes: Object {
    @objc dynamic public var title: String = ""
    @objc dynamic public var duration: Double = 0.0
}
