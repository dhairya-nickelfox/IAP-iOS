//
//  Bookmark.swift
//  Model
//
//  Created by Abhishek Thapliyal on 31/07/21.
//  Copyright © 2021 Nickelfox. All rights reserved.
//
//
//import Foundation
//import JSONParsing
//
//extension Bookmark: JSONCoreDataParsable {
//
//	public static var primaryKeyValues: [PrimaryKey] {
//		return [
//			PrimaryKey(
//				keypath: "title",
//				jsonKeypath: "title"
//			)
//		]
//	}
//
//	public func update(json: JSON) throws {
//		do {
//			self.title = try json["title"]^
//			self.duration = try json["duration"]^
//		} catch {
//			throw error
//		}
//	}
//}
