//
//  DictionaryManager.swift
//  FrenchTodayWidget
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import Foundation


class DataManager {
	var words: [Word] = []
	
	var selectedWord: Word? 
	
	private static var _instance: DataManager? = nil
	
	
	static func getInstance() -> DataManager{
		if (DataManager._instance == nil){
			_instance = DataManager()
		}
		return _instance!
	}
	
	init() {
		
	}
	
	
	func fetchData(){
		
	}
	
	func getRandomWord() -> Word {
		var word = Word()
		word.word = "Lundi"
		word.meaning = "MondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMondayMonday"
		return word;
	}
	
	
	
}
