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
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	@IBAction func refreshManually(){
		UIView.animate(withDuration: 0.3) {
			self.content.text = "Your resized app icons for iOS and Android are attached with this email; I hope you like it."
		}
	}

}

