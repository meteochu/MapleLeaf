//
//  QuestionBank.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

class QuestionBank: NSObject {
	
	static let shared: QuestionBank = QuestionBank()
	
	var questions: [Question] = []
	
	override init() {
		super.init()
		let decoder = JSONDecoder()
		if let path = Bundle.main.path(forResource: "questions", ofType: "json"),
			let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
			let questions = try? decoder.decode([Question].self, from: data) {
			self.questions = questions
		}
	}
	
	func createTest(numQuestions: Int) -> Test {
		return Test(questions: questions.choose(numQuestions))
	}

}
