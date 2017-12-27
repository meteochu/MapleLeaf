//
//  RootViewController.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-26.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

	@IBOutlet weak var detailLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(updateQuiz),
											   name: .quizUpdated, object: nil)
		updateQuiz()
    }
	
	@objc
	func updateQuiz() {
		self.title = QuizController.shared.currentQuiz.title
		detailLabel.text = QuizController.shared.currentQuiz.description
    }

}
