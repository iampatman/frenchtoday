//
//  DictionaryManager.swift
//  FrenchTodayWidget
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import Foundation
import Firebase
let UPDATE_INTEVAL : [Int:Double] = [0: 86400.0, 1: 43200.0, 2: 3.0]
class DataManager {
	var words: [Word] = []
	
	var selectedWord: Word? 
	var selectedInterval = 0
	private static var _instance: DataManager? = nil
		
	static func getInstance() -> DataManager{
		if (DataManager._instance == nil){
			_instance = DataManager()
		}
		return _instance!
	}
	
	init() {
		initFirestore()
        self.selectedInterval = UserDefaults.standard.integer(forKey: "kRefreshingRate")
        let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
        let text = sharedDefaults?.string(forKey: "kCurrentQuote")
        guard sharedDefaults?.string(forKey: "kCurrentQuote") != nil else {
            sharedDefaults?.set("Our greatest weapon against stress is our ability to choose one thought over another.", forKey: "kCurrentQuote")
            return;
        }
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
	
	func getCurrentQuote() -> String {
		let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
		guard let text = sharedDefaults?.string(forKey: "kCurrentQuote") else {
			return ""
		}
		return text
	}
	
    
    
    func saveUpdateTime(){
        let currentTime = Date()
        print("savedUpdateTime \(currentTime)")
        let timeInterval = Int(currentTime.timeIntervalSince1970)
        UserDefaults.standard.set(timeInterval, forKey: "kLastUpdate")
    }
    
    
    func needToUpdate()->Bool {
        guard let timeInterval = UserDefaults.standard.object(forKey: "kLastUpdate") as? Double else {
            print("timeInterval not found")
            return true
        }
        self.selectedInterval = UserDefaults.standard.integer(forKey: "kRefreshingRate")
        print("selectedInterval \(selectedInterval)");
        let lastUpdateDate = Date(timeIntervalSince1970: Double(timeInterval))
        print("lastUpdateDate \(lastUpdateDate)")

        let nextUpdate = lastUpdateDate.addingTimeInterval(UPDATE_INTEVAL[self.selectedInterval]!) as Date
        print("nextUpdate \(nextUpdate)")
        return nextUpdate.compare(Date()) == ComparisonResult.orderedAscending

    }
	
	
	
	func getNewQuote(forced: Bool = false, completionHandler: (() -> Void)? ){
		if !forced {
        	guard needToUpdate() == true else {
            	return
        	}
		}
		guard words.count > 0 else {
			return
		}
		let randomNum = Int(arc4random_uniform(UInt32(words.count)))
		let word = self.words[randomNum as Int] as Word
		let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
        print("new quote: \(word.meaning)")
		sharedDefaults?.set(word.meaning, forKey: "kCurrentQuote")
		sharedDefaults?.synchronize()
        self.saveUpdateTime()
        if let completion = completionHandler {
            completion()
        }
        

	}
	

	
	
	
}
