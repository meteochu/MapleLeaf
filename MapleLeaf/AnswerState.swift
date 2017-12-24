//
//  AnswerState.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-24.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

enum AnswerState {
	case correct
	case wrong
	case unanswered
}

extension UIColor {
	
	static let unanswered = UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1)
	
	static let wrong = UIColor(red: 1.0, green: 0.3, blue: 0.3, alpha: 1)
	
	static let correct = UIColor(red: 0, green: 0.8, blue: 0.4, alpha: 1)
	
}
