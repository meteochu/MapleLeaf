//
//  SettingsViewController.swift
//  MapleLeaf
//
//  Created by Andy Liang on 2017-12-26.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

	private var quizNames: [String] = []
	
	@IBOutlet weak var numQuestionsLabel: UILabel!
	
	@IBOutlet weak var numQuestionsStepper: UIStepper!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		let paths = Bundle.main.paths(forResourcesOfType: "json", inDirectory: nil, forLocalization: nil)
		quizNames = paths.map { $0.lastPathComponent.deletingPathExtension }
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		tableView.reloadData()
    }

	@IBAction func didSelectDoneButton(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func didUpdateStepper(_ sender: UIStepper) {
		let value = Int(sender.value)
		numQuestionsLabel.text = "\(value)"
		Preferences.numQuestions = value
	}
	
	// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return section == 0 ? 1 : quizNames.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard indexPath.section == 1 else {
			return super.tableView(tableView, cellForRowAt: indexPath)
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel!.text = quizNames[indexPath.row]
		cell.accessoryType = quizNames[indexPath.row] == Preferences.currentFileName ? .checkmark : .none
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard indexPath.section == 1 else { return }
		Preferences.currentFileName = quizNames[indexPath.row]
		tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
		NotificationCenter.default.post(name: .quizUpdated, object: nil)
	}

}


extension String {
	
	var deletingPathExtension: String {
		return (self as NSString).deletingPathExtension
	}
	
	var lastPathComponent: String {
		return (self as NSString).lastPathComponent
	}
	
}
