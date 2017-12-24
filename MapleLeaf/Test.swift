//
//  Test.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

struct Test {
	
	var questions = [Question]()
	
	var usedQuestions = [Question]()
	
	var remainingQuestions: Int { return questions.count }
	
	var questionsAsked: Int { return usedQuestions.count }
	
	var totalQuestions: Int { return remainingQuestions + questionsAsked }
	
	init(questions: [Question]) {
		self.questions = questions
	}
	
	mutating func popQuestion() -> Question {
		let question = questions.popRandomElement()
		usedQuestions.append(question)
		return question
	}
	
}
