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
	}

    override func viewWillAppear(_ animated: Bool) {
        content.text = getContent()
    }
    
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	func getContent()-> String {
		return DataManager.getInstance().getCurrentQuote()

	}
	
	
	@objc func receivedUserDefaultUpdate(){
        DispatchQueue.main.async {
            self.content.text = self.getContent()
        }
	}
	
	@IBAction func refreshManually(){
		DataManager.getInstance().getNewQuote(completionHandler: nil)
	}

}

