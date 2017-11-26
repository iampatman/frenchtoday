//
//  AppDelegate.swift
//  FrenchToday
//
//  Created by Nguyen Bui An Trung on 20/11/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		FirebaseApp.configure()
		if UserDefaults.standard.object(forKey: "kRefreshingRate") == nil {
			UserDefaults.standard.set(0, forKey: "kRefreshingRate")

		}
		let dataManager = DataManager.getInstance()
		let sharedDefaults = UserDefaults(suiteName: "group.trungnba.TodayExtensionSharingDefaults")
		print(sharedDefaults?.string(forKey: "kCurrentQuote"))
	
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {

	}

	func applicationDidEnterBackground(_ application: UIApplication) {
	}

	func applicationWillEnterForeground(_ application: UIApplication) {

	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

