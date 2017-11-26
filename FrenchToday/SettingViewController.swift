//
//  SettingViewController.swift
//  FrenchToday
//
//  Created by Nguyen Bui An Trung on 26/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {

	var selectedInterval = 0
	@IBOutlet weak var savedMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
		subViews()
    }

	func subViews(){
		let savedMsgView = UIView(frame: CGRect(x: 0, y: self.tableView.bounds.maxY - 100, width: self.tableView.bounds.maxX, height: 20))
		let savedMsgLabel = UILabel(frame: savedMsgView.frame)
		savedMsgLabel.text = "Saved settings successfully"
		savedMsgView.addSubview(savedMsgLabel)
		self.tableView.addSubview(savedMsgView)
		self.tableView.bringSubview(toFront: savedMsgView)
		
		self.selectedInterval = UserDefaults.standard.integer(forKey: "kRefreshingRate")
		tableView.cellForRow(at: IndexPath(row: self.selectedInterval, section: 0))?.accessoryType = .checkmark
		tableView.rectForRow(at: IndexPath(row: self.selectedInterval, section: 0))
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
	func flashSavedMessage(){
		UIView.animate(withDuration: 1, animations: {
			self.tableView.cellForRow(at: IndexPath(row: 0, section: 1))?.isHidden = false
		}) { (true) in
			UIView.animate(withDuration: 1, animations: {
				self.tableView.cellForRow(at: IndexPath(row: 0, section: 1))?.isHidden = true
			})
			
		}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if (indexPath.section == 0 && indexPath.row != selectedInterval){
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
			let selectedIP = IndexPath(row: selectedInterval, section: 0)
			tableView.cellForRow(at: selectedIP)?.accessoryType = .none
			selectedInterval = indexPath.row
			UserDefaults.standard.set(selectedInterval, forKey: "kRefreshingRate")
		}
		UIView.animate(withDuration: 0.5) {
			tableView.deselectRow(at: indexPath, animated: true)
		}
	}
	

}
