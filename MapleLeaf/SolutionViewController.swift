//
//  SolutionViewController.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2018-01-06.
//  Copyright © 2018 Andy Liang. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {
	
	@IBOutlet weak var questionLabel: UILabel!
	
	var currentQuestion: Question!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.updateQuestion()
	}

	private func updateQuestion() {
		guard let question = currentQuestion, let label = questionLabel else { return }
		label.text = question.title
		UIView.animate(withDuration: 0.3) {
			for idx in 0..<question.answers.count {
				if let button = self.view.viewWithTag(idx + 1) as? AnswerButton {
					button.isHidden = false
					button.text = question.answers[idx].value
					let state = question.isCorrect(index: idx) ? AnswerState.correct : .unanswered
					button.updateBackground(for: state)
				}
			}
		}
		
		for idx in question.answers.count..<4 { // 4 buttons
			self.view.viewWithTag(idx+1)?.isHidden = true
		}
	}

}
