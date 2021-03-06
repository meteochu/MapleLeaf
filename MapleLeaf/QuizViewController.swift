//
//  QuizViewController.swift
//  Citizenship
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

	// MARK: UI elements
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var nextButton: UIButton!
	
	@IBOutlet weak var statsLabel: UILabel!
	
	// MARK: Controller
	private var testBank = QuizController.shared.currentQuiz.createQuiz()
	
	private var currentQuestion: Question!
	
	private var didAnswer: Bool = false {
		didSet {
			nextButton.isEnabled = didAnswer
		}
	}
	
	private var numCorrect: Int = 0
	
	override func viewDidLoad() {
        super.viewDidLoad()
		// refresh question
		self.refreshQuestion()
    }
	
	func refreshQuestion() {
		guard testBank.remainingQuestions > 0 else {
			// out of questions here. exit here.
			let passed = Double(numCorrect)/Double(testBank.totalQuestions) >= 0.75
			let title = passed ? "You passed! 😍" : "You failed 😔"
			let alertController = UIAlertController(title: title, message: "You scored \(numCorrect) out of \(testBank.totalQuestions)", preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: "Restart", style: .default, handler: { action in
				self.resetTest()
				alertController.dismiss(animated: true, completion: nil)
			}))
			
			alertController.addAction(UIAlertAction(title: "Exit", style: .default, handler: { action in
				self.navigationController?.popToRootViewController(animated: true)
				alertController.dismiss(animated: true, completion: nil)
			}))
			self.present(alertController, animated: true, completion: nil)
			return
		}
		let question = testBank.popQuestion()
		questionLabel.text = question.title
		for idx in 0..<question.answers.count {
			if let button = self.view.viewWithTag(idx + 1) as? AnswerButton {
				button.isHidden = false
				button.text = question.answers[idx].value
				button.updateBackground(for: .unanswered)
			}
		}
		
		for idx in question.answers.count..<4 { // 4 buttons
			self.view.viewWithTag(idx+1)?.isHidden = true
		}
		
		currentQuestion = question
		self.title = "Question \(testBank.questionsAsked)"
		didAnswer = false
		statsLabel.text = "\(numCorrect)/\(testBank.totalQuestions) Correct"
	}

	func resetTest() {
		currentQuestion = nil
		numCorrect = 0
		didAnswer = false
		testBank = QuizController.shared.currentQuiz.createQuiz()
		refreshQuestion()
	}
	
	@IBAction
	func didSelectAnswer(_ sender: UITapGestureRecognizer) {
		guard !didAnswer else { return }
		didAnswer = true
		guard let button = sender.view as? AnswerButton else { return }
		
		if currentQuestion.isCorrect(index: button.tag-1) {
			// show that the answer is correct
			UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
				button.updateBackground(for: .correct)
			}, completion: nil)
			
			numCorrect += 1
		} else {
			// reveal answer
			for i in 0..<currentQuestion.answers.count where currentQuestion.isCorrect(index: i) {
				if let ansButton = self.view.viewWithTag(i+1) as? AnswerButton {
					UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
						// animate the 2 buttons together...
						ansButton.updateBackground(for: .correct)
						button.updateBackground(for: .wrong)
					}, completion: nil)
				}
			}
		}
	}
	
	@IBAction func didSelectNextButton(_ sender: UIButton) {
		if didAnswer {
			refreshQuestion()
		}
	}
	
}
