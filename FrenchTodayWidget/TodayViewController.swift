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
	
	@IBOutlet weak var word: UILabel!
	@IBOutlet weak var meaning: UILabel!
	var currentWord: Word? {
		didSet {
			self.widgetPerformUpdate { (result) in
				print(result)
			}
		}
	}
	
	var dataManager = DataManager.getInstance()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		currentWord = dataManager.getRandomWord()
		extensionContext?.widgetLargestAvailableDisplayMode = .expanded
		
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
		guard let newWord = self.currentWord else {
			completionHandler(NCUpdateResult.failed)
			return;
		}
		word.text = newWord.word
		meaning.text = newWord.meaning
        completionHandler(NCUpdateResult.newData)
    }
	
	
	func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
		let expanded = activeDisplayMode == .expanded
		preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
	}
    
}
