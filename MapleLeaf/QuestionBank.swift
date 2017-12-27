//
//  QuestionBank.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

struct QuestionBank: Codable {
	
	var title: String
	
	var description: String
	
	var questions: [Question]
	
	func createQuiz() -> Test {
		return Test(questions: questions.choose(Preferences.numQuestions))
	}

}
