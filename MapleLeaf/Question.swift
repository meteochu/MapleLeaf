//
//  Question.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

struct Question: CustomStringConvertible, Codable {
	
	var title: String
	
	var answers: [Answer]
	
	func isCorrect(index: Int) -> Bool {
		guard index < answers.count else { return false }
		return answers[index].isCorrect
	}
	
	var description: String {
		return title + " " + answers.description
	}
	
}

