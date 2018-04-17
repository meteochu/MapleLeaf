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
	// current selected question
	private var question: Question?
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allQuestions.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let question = allQuestions[indexPath.row]
		cell.textLabel!.text = "\(indexPath.row + 1). \(question.title)"
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
		question = allQuestions[indexPath.row]
		self.performSegue(withIdentifier: "solutionSegue", sender: self)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let viewController = segue.destination as? SolutionViewController else { return }
		viewController.currentQuestion = question
	}
	
}
