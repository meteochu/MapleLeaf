//
//  Array++.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-23.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

extension Array {
	
	/// Returns an array containing this sequence shuffled
	var shuffled: Array {
		var elements = self
		return elements.shuffle()
	}
	
	/// Shuffles this sequence in place
	@discardableResult
	mutating func shuffle() -> Array {
		let count = self.count
		indices.lazy.dropLast().forEach {
			swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
		}
		return self
	}
	
	var chooseOne: Element {
		return self[Int(arc4random_uniform(UInt32(count)))]
	}
	
	func choose(_ n: Int) -> Array {
		return Array(shuffled.prefix(n))
	}
	
	mutating func popRandomElement() -> Element {
		let index = Int(arc4random_uniform(UInt32(count)))
		return self.remove(at: index)
	}
	
}
