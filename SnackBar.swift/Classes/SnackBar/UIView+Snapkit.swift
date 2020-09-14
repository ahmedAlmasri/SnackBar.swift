//
//  UIView+Snapkit.swift
//  Pods-SnackBar.swift_Example
//
//  Created by Ahmad Almasri on 9/14/20.
//

import Foundation
import SnapKit

extension UIView {
	
	func setupSubview(_ subview: UIView, setup: (ConstraintViewDSL) -> Void) {
		self.addSubview(subview)
		setup(subview.snp)
	}
	
}
