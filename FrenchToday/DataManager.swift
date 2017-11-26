//
//  DictionaryManager.swift
//  FrenchTodayWidget
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import Foundation
import Firebase

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
		initFirestore()
	}
	
	func initFirestore(){
		let defaultStore = Firestore.firestore()
		defaultStore.collection("quotes").getDocuments { (snapsshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
			} else {
				for document in snapsshot!.documents {
					print("\(document.documentID) => \(document.data())")
					self.words.append(Word(word: "", meaning: document.data()["content"] as! String))
				}
			}
		}
	}
	
	func getNewQuote(){
		guard words.count > 0 else {
			return
		}
		let randomNum = Int(arc4random_uniform(UInt32(words.count)))
		let word = self.words[randomNum as Int] as Word
		let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
		sharedDefaults?.set(word.meaning, forKey: "kCurrentQuote")
		sharedDefaults?.synchronize()
	}
	

	
	
	
}
