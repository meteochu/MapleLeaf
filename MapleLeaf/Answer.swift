//
//  Answer.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

struct Answer: CustomStringConvertible, Codable {
	
	var value: String
	var isCorrect: Bool
	
	var description: String {
		return (isCorrect ? "✅ " : "") + value
	}
	
}

