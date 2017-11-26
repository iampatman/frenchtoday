//
//  ViewController.swift
//  FrenchToday
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

	
	@IBOutlet weak var content: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.receivedUserDefaultUpdate), name: UserDefaults.didChangeNotification, object: nil)
		content.text = getContentFromUD()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	func getContentFromUD()-> String {
		let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
		guard let text = sharedDefaults?.string(forKey: "kCurrentQuote") else {
			return ""
		}
		return text
	}
	
	
	@objc func receivedUserDefaultUpdate(){
		self.content.text = getContentFromUD()
	}
	
	@IBAction func refreshManually(){
		DataManager.getInstance().getNewQuote()
	}

}

