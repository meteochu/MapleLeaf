//
//  AnswersViewController.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-26.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

class AnswersViewController: UITableViewController {
	
	private var allQuestions = QuizController.shared.currentQuiz.questions
	// cache the answer key for faster fetching
	private var answerKey: [IndexPath: String] = [:]
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allQuestions.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let question = allQuestions[indexPath.row]
		cell.textLabel!.text = question.title
		if let answer = answerKey[indexPath] {
			cell.detailTextLabel!.text = answer
		} else {
			for answer in question.answers where answer.isCorrect {
				answerKey[indexPath] = answer.value
				cell.detailTextLabel!.text = answer.value
			}
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}
