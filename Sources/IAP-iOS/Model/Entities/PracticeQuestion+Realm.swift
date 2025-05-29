//
//  PracticeQuestion+Realm.swift
//  Model
//
//  Created by Akanksha Trivedi on 23/10/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import RealmSwift

extension PracticeQuestion {
    
    public func answeredOption(isCorrect: Bool) {
        do {
            let realm = try Realm()
            do {
                try realm.write {
                    self.didAnswerCorrect = isCorrect ? true : false
                }
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
}
