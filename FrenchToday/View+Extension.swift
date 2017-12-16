//
//  View+Extension.swift
//  FrenchToday
//
//  Created by Nguyen Bui An Trung on 15/12/17.
//  Copyright © 2017 Nguyen Bui An Trung. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	func shake() {
		let animation = CABasicAnimation(keyPath: "position")
		animation.duration = 0.08
		animation.repeatCount = 2
		animation.autoreverses = true
		
		animation.fromValue = CGPoint(x: self.center.x-10, y: self.center.y)
		animation.toValue = CGPoint(x: self.center.x+10, y: self.center.y)
		
		self.layer.add(animation, forKey: "position")
		
	}
}
