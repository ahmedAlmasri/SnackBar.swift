//
//  UIView+Swipe.swift
//  CommonUI
//
//  Created by Ahmad Almasri on 9/14/20.
//

import Foundation

extension UIView {
	
	func addSwipeGestureAllDirection(action: Selector) {
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: action)
        swipeLeft.direction = .left
		swipeLeft.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: action)
        swipeRight.direction = .right
		swipeRight.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeRight)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: action)
        swipeUp.direction = .up
		swipeUp.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: action)
        swipeDown.direction = .down
		swipeDown.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeDown)
	}
}
