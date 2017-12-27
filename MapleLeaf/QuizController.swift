//
//  QuizController.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-26.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

extension Notification.Name {
	static let quizUpdated = Notification.Name(rawValue: "quizUpdated")
}

class QuizController: NSObject {
	
	static let shared: QuizController = QuizController()
	
	private(set) var currentQuiz: QuestionBank!
	
	override init() {
		super.init()
		self.updateQuestionBank()
		NotificationCenter.default.addObserver(self, selector: #selector(updateQuestionBank), name: .quizUpdated, object: nil)
	}
	
	@objc
	func updateQuestionBank() {
		guard let path = Bundle.main.path(forResource: Preferences.currentFileName, ofType: "json") else {
			return
		}
		do {
			let decoder = JSONDecoder()
			let data = try Data(contentsOf: URL(fileURLWithPath: path))
			self.currentQuiz = try decoder.decode(QuestionBank.self, from: data)
		} catch {
			print("problem")
		}
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
}
