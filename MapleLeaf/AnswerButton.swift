//
//  AnswerButton.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

@IBDesignable
class AnswerButton: UIView {

	private let label = UILabel()
	
	@IBInspectable
	var text: String {
		get {
			return label.text ?? ""
		} set {
			label.text = newValue
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.commonInit()
	}
	
	func updateBackground(for state: AnswerState) {
		switch state {
		case .unanswered:	self.backgroundColor = .unanswered
		case .wrong: 		self.backgroundColor = .wrong
		case .correct: 		self.backgroundColor = .correct
		}
	}
	
	private func commonInit() {
		// add view
		self.translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false
		self.layer.cornerRadius = 12
		self.addSubview(label)
		// customize
		label.textColor = .white
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.numberOfLines = 0
		// add constraints
		self.heightAnchor.constraint(equalTo: label.heightAnchor, constant: 16).isActive = true
		label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
		label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
		label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
	}

}
