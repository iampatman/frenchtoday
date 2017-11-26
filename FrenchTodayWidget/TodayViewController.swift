//
//  TodayViewController.swift
//  FrenchTodayWidget
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
	
	@IBOutlet weak var meaning: UILabel!
	var content: String? {
		didSet {
			self.widgetPerformUpdate { (result) in
				print(result)
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		extensionContext?.widgetLargestAvailableDisplayMode = .compact
		let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
		guard let text = sharedDefaults?.string(forKey: "kCurrentQuote") else {
			self.content = "Not loaded"
			return
		}
		self.content = text
		
		let tapGesture = UIGestureRecognizer(target: self, action: #selector(TodayViewController.tapGestureAction))
		self.meaning.isUserInteractionEnabled = true
		self.meaning.addGestureRecognizer(tapGesture)
    }
	
	@objc func tapGestureAction(){
		print("tapGestureAction")
		doLaunchApp()
	}
	func doLaunchApp() {
		if let url = URL(string: "InspireMe://") {
			self.extensionContext?.open(url, completionHandler: nil)
		}
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
		guard let newQuote = self.content else {
			completionHandler(NCUpdateResult.failed)
			return;
		}
		meaning.text = newQuote
        completionHandler(NCUpdateResult.newData)
    }
	
	
	func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
		let expanded = activeDisplayMode == .expanded
		preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
	}
    
}
