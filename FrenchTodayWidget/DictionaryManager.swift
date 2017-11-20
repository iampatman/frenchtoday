//
//  DictionaryManager.swift
//  FrenchTodayWidget
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import Foundation


class DictionaryManager {
	var words: [Word] = []
	
	
	private static var _instance: DictionaryManager? = nil
	
	
	static func getInstance() -> DictionaryManager{
		if (DictionaryManager._instance == nil){
			_instance = DictionaryManager()
		}
		return _instance!
	}
	
	init() {
		
	}
	
	
	func getRandomWord() -> Word {
		var word = Word()
		word.word = "Lundi"
		word.meaning = "Monday"
		
		return word;
	}
	
	
	
}
