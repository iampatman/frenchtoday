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
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if (indexPath.section == 0){
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
			let selectedIP = IndexPath(row: selectedInterval, section: 0)
			tableView.cellForRow(at: selectedIP)?.accessoryType = .none
			selectedInterval = indexPath.row

		}
		UIView.animate(withDuration: 0.5) {
			tableView.deselectRow(at: indexPath, animated: true)
		}
	}
	

}
