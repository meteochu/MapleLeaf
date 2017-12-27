//
//  Preferences.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-26.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

struct Preferences {
	
	static var isFirstLaunch: Bool {
		get {
			return !UserDefaults.standard.bool(forKey: "hasLaunchedOnce")
		} set {
			UserDefaults.standard.set(!newValue, forKey: "hasLaunchedOnce")
		}
	}
	
	static var currentFileName: String {
		get {
			return UserDefaults.standard.string(forKey: "currentFileName") ?? ""
		}
		set {
			UserDefaults.standard.set(newValue, forKey: "currentFileName")
		}
	}
	
	static var numQuestions: Int {
		get {
			return UserDefaults.standard.integer(forKey: "numQuestions")
		}
		set {
			UserDefaults.standard.set(newValue, forKey: "numQuestions")
		}
	}
	
}
